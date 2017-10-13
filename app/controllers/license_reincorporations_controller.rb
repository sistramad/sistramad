class LicenseReincorporationsController < ApplicationController
  include EmailService
  include FactoryHelper
  include ProceduresHelper
  before_action :set_procedure, only: [:show, :edit, :update, :destroy, :validate, :consult, :show_participants, :fill_info]
  before_action :set_user
  before_action :can_be_reincorporated_validation, only: [:new]

  def index
    @procedures = @user.procedures.where(code: %w[T-SLR204 T-SPL205 T-SRL206]).sort_by &:created_at
  end

  def show
    
  end

  def new
    code = params[:code]
    procedure_concrete = get_procedure_from_factory(code)
    
    @procedure = Procedure.new
    @parent = Procedure.find(params[:parent_id])
    @procedure.parent = @parent
    @procedure.name = procedure_concrete.name
    @procedure.code = procedure_concrete.code
   
    @documents = Array.new 
    @documents = documents_required(@user, @procedure, @parent)
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
        
        format.html { redirect_to license_reincorporation_path(@procedure), notice: 'La solicitud del trámite se ha creado exitosamente.'}
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
      format.html { redirect_to licenses_path, notice: 'La solicitud fue cancelada con éxito.' }
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
      redirect_to license_reincorporation_path(@procedure), notice: 'La solicitud ha sido confirmada, ha pasado al proceso de evaluación.'
    else
      flash[:error] = 'La solicitud No ha podido completarse, asegurese cumplir todos los requerimientos necesarios.'
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

    def documents_required(user, procedure, parent)
      excluded = [] #Array con los documetos que excluira 
      user_docs = user.documents.where(code: %w[CI RIF]) #Excluye estos documentos si ya el usuario los tiene cargados
      
      user_docs.each do |doc|
        excluded << doc.code    
      end

      if parent.license_type.code != "2" #Si la licencia no es por Estudios se agrega al array de los excluidos estos documentos
        excluded = excluded + (%w[D-SB D-DP D-PDT])
      end
      
      procedure_documents = DocumentMaster.where(procedure: procedure.name, active: true, initially_required: true)
                            .where.not(code: excluded)
      return procedure_documents
    end
    
    def can_be_reincorporated_validation
      @parent = Procedure.find(params[:parent_id])

      if @parent.present?
        concrete_procedure = get_procedure_from_factory(@parent.code)
        concrete_procedure.procedure = @parent
      end

      unless concrete_procedure.can_be_reincorporated?
        redirect_to license_path(@parent)
        flash[:error] = "Imposible realizar solicitud, ya existe una solicitud o han pasado más de 30 días desde que finalizó la licencia."
      end
    end

end
