
class ProceduresController < ApplicationController
  before_action :set_procedure, only: [:show, :edit, :update, :destroy, :validate]
  before_action :set_user

  # GET /procedures
  # GET /procedures.json
  def index
    @procedures = @user.procedures
  end

  # GET /procedures/1
  # GET /procedures/1.json
  def show
  end

  def new
    code = params[:code]
    procedure_factory = ProcedureFactory.new
    proce = procedure_factory.build(code)
    
    @procedure = Procedure.new    
    @procedure.name = proce.name
    @procedure.code = proce.code

    @documents = Array.new 
    @documents = documents_required()
  end

  # GET /procedures/1/edit
  def edit

  end

  def create
    @procedure = Procedure.new(procedure_params)
    @procedure.user = @user

    @documents = Array.new
    create_documents()
   
    respond_to do |format|
      if @procedure.save
        set_documents_to_procedure()
        set_documents_to_user()
        generate_workflow()
        
        format.html { redirect_to @procedure, notice: 'La solicitude del trámite se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @procedure }
      else
        puts "Errors"
        puts @procedure.errors.full_messages
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

  #GET /procedures/1
  def validate
    if initial_requirements_valid?
      NotificationMailer.sample_email(@user).deliver_now
      redirect_to procedures_path, notice: 'La solicitud ha sido confirmada, ha pasado al proceso de evaluación.'
    else
      flash[:error] =  'La solicitud No ha podido completarse, asegurese cargar todos los requerimientos necesarios'
      render :show 
    end
  end

  private

    def set_user
      @user = User.find(current_user.id)
    end

    def procedure_params
      params.require(:procedure).permit(:name, :code, documents_attributes: [:id,:name,:code, :attachment])
    end

    def document_params (document)
      document.permit(:name,:code,:attachment)
    end

    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def documents_required
      procedure_documents = DocumentMaster.where(procedure: @procedure.name, active: true)
      procedure_documents.each do |doc|
        puts doc.code
        @documents << Document.new(name: doc.name, code: doc.code)      
      end
      procedure_documents
    end  

    def create_documents
      documents_param = params[:documents]   
      documents_param.each do |param|     
        document = param[1]
        doc = Document.new(document_params(document))      
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

    def generate_workflow
      workflow = Workflow.new()
      #workflow = Workflow.new(name = "Workflow Año Sabatico", description = "Flujo principal del trámite para año Sabatico", is_active = true)
      workflow.name = "Workflow Año Sabatico"
      workflow.description = "Flujo principal del trámite para año Sabatico"
      workflow.is_active = true
      workflow.procedure = @procedure

      if workflow.save
        generate_steps(workflow)
      else

      end 

    end

    def generate_steps(workflow)
      step = Step.new()
      #step = Steps.new(name = "paso 1", description = "description paso 1", status = "created", is_active = true)
      step.name = "paso 1"
      step.description = "descripcion del paso 1"
      step.status = "created"
      step.is_active = true
      step.workflow = workflow
      step.save

      step = Step.new()
      #step = Steps.new(name = "paso 1", description = "description paso 1", status = "created", is_active = true)
      step.name = "paso 2"
      step.description = "descripcion del paso 2"
      step.status = "created"
      step.is_active = true
      step.workflow = workflow
      step.save
    end

    def initial_requirements_valid?
      puts "validando el procedimiento: #{@procedure.name} - #{@procedure.code}"   

      procedure_factory = ProcedureFactory.new
      m_procedure = procedure_factory.build(@procedure.code)
      @procedure.start! if m_procedure.requirements_valid?(@procedure)
      @procedure.in_progress?
    end
end
