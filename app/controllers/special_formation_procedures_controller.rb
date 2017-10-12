
class SpecialFormationProceduresController < ApplicationController
  include EmailService
  include FactoryHelper
  include ProceduresHelper
  before_action :set_procedure, only: [:show, :edit, :update, :destroy, :validate, :consult]
  before_action :set_user

  def index
    @procedures = Procedure.where(code: 'T-SPF200').sort_by &:created_at
  end

  def show
  end

  def new
    code = params[:code]
    procedure_concrete = get_procedure_from_factory(code)
    
    @procedure = Procedure.new    
    @procedure.name = procedure_concrete.name
    @procedure.code = procedure_concrete.code

    if params.has_key?(:parent_id)
      @procedure.parent = Procedure.find(params[:parent_id])
    end
   
    @documents = Array.new 
    @documents = documents_required(@user, @procedure)

    @procedure.registered_users.build
  end

  def edit

  end

  def create
    @procedure = Procedure.new(procedure_params)
    @procedure.user = @user
    procedure_concrete = get_procedure_from_factory(@procedure.code)
    
    @documents = Array.new
    create_documents()

    respond_to do |format|
      if @procedure.save
        set_documents_to_procedure()       
        procedure_concrete.generate_workflow(@procedure)
        
        format.html { redirect_to special_formation_procedure_path(@procedure), notice: 'La solicitud del trámite se ha creado exitosamente.'}
        format.json { render :show, status: :created, location: @procedure }
      else
        @procedure.errors.full_messages
        flash[:error] = 'Error. Asegurese de llenar todos los campos.'
        @documents = documents_required(@user, @procedure)
        format.html { render :new }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end 

  def update
    respond_to do |format|
      if @procedure.update(procedure_params)
        format.html { redirect_to @procedure, notice: 'Procedure was successfully updated.' }
        format.json { render :show, status: :ok, location: @procedure }
      else
        format.html { render :edit }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @procedure.destroy
      respond_to do |format|
      format.html { redirect_to special_formation_procedures_path, notice: 'La solicitud fue cancelada con éxito.' }
      format.json { head :no_content }
    end
  end

  def show_requirements
    @procedure = Procedure.find(params[:procedure])
    render 'requirements'
  end

  def validate
    concrete_procedure = get_procedure_from_factory(@procedure.code)
    concrete_procedure.procedure = @procedure
    if concrete_procedure.initial_requirements_valid?  
      redirect_to special_formation_procedure_path(@procedure), notice: 'La solicitud ha sido confirmada, ha pasado al proceso de evaluación.'
    else
      flash[:error] = 'La solicitud No ha podido completarse, asegurese cargar todos los requerimientos necesarios.'
      render :show 
    end
  end

  private

    def set_user
      @user = User.find(current_user.id)
    end

    def procedure_params
      params.require(:procedure).permit(:name, :code, :parent_procedure_id, 
      documents_attributes: [:id,:name,:code, :attachment],
      registered_users_attributes: [:id, :first_name, :last_name, :identification_number, :_destroy])
    end

    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def create_documents
      documents_param = params.permit(documents: [:name, :code, :attachment])
      documents_param[:documents].each do |k, document_hash|
        doc = Document.new(document_hash)
        doc.save
        @documents << doc
      end
    end

    def set_documents_to_procedure
      @procedure.documents << @documents
    end
    
    def set_documents_to_user
      @user.documents << @procedure.documents
    end

end
