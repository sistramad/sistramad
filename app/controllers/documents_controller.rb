class DocumentsController < ApplicationController
  before_action :set_document, only: [:edit, :update, :destroy, :show]

 def index
    @documents = Document.all
  end

  def new
    @document = Document.new
    if params.key?(:name) and params.key?(:code) and params.key?(:procedure) and params.key?(:step)
      @document.name = params[:name]
      @document.code = params[:code]
      @procedure = params[:procedure]
      @step_name = params[:step]
    end
  end

  def create
    @document = Document.new(document_params)
    @procedure = Procedure.find(params[:procedure])
    unless @procedure.nil?
      @document.procedure = @procedure
      @document.user = current_user
    end

    if @document.save
      update_step()
      if current_user.has_role? :admin
        redirect_to admin_procedure_path(@procedure), notice: "El documento #{@document.name} ha sido cargado con exito."
      else
        redirect_to procedure_path(@procedure), notice: "El documento #{@document.name} ha sido cargado con exito."
      end
    else
      render "new"
    end
  end

  def edit

  end

  def show
   
  end

  def update
    if @document.update(document_params)
      redirect_to procedure_path(@document.procedure_id), notice: "El documento ha sido actualizado."
    else
      render "new"
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_path, notice:  "The Document #{@document.name} has been deleted."
  end

private
  def document_params
    params.fetch(:document, {}).permit(:name, :attachment, :code)
  end

  def set_document
    @document = Document.find(params[:id])
  end

  def update_step()
    step_name = params[:step]
    unless @procedure.nil? or step_name.nil?
      concrete_procedure = get_procedure_intance(@procedure)
      concrete_procedure.start_step(step_name)
    end
  end

  def get_procedure_intance(procedure_obj)
    procedure_instance = get_procedure_from_factory(procedure_obj.code)
    procedure_instance.procedure = procedure_obj
    return procedure_instance
  end

  def get_procedure_from_factory(procedure_code)
    factory = ProcedureFactory.new
    factory.build(procedure_code)
  end

end
