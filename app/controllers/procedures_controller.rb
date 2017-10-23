
class ProceduresController < ApplicationController
  include EmailService
  include FactoryHelper
  include ProceduresHelper
  before_action :set_procedure, only: [:show, :edit, :update, :destroy, :validate, :consult]
  before_action :set_user

  # GET /procedures
 
  def index
    @procedures = @user.procedures.where({code: ["T-AS100", "T-AS101", "T-AS102", "T-AS103", "T-AS104", "T-AS105" ]}).sort_by(&:created_at)

  end

  def special_formation
    @procedures = Procedure.where code: params[:code]
  end

  # GET /procedures/1  
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

    @documents = documents_required(@user, @procedure)
  end

  # GET /procedures/1/edit
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
        set_documents_to_user()
        procedure_concrete.generate_workflow(@procedure)
        
        format.html { redirect_to @procedure, notice: 'La solicitud del trámite se ha creado exitosamente.'}
        format.json { render :show, status: :created, location: @procedure }
      else
        @procedure.errors.full_messages
        format.html { render :new }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end 

  # PATCH/PUT /procedures/1
  # PATCH/PUT /procedures/1.json
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

  # DELETE /procedures/1
  # DELETE /procedures/1.json
  def destroy
    @procedure.destroy
      respond_to do |format|
      format.html { redirect_to procedures_path, notice: 'La solicitud fue cancelada con éxito.' }
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
      redirect_to procedure_path(@procedure), notice: 'La solicitud ha sido confirmada, ha pasado al proceso de evaluación.'
    else
      flash[:error] = 'La solicitud No ha podido completarse, asegurese cargar todos los requerimientos necesarios, o la
        la fecha de la solicitud esta fuera de la permitida.'
      render :show 
    end
  end

  private

    def set_user
      @user = User.find(current_user.id)
    end

    def procedure_params
      params.require(:procedure).permit(:name, :code, :parent_procedure_id, documents_attributes: [:id,:name,:code, :attachment])
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
