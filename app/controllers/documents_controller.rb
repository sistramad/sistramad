class DocumentsController < ApplicationController
  before_action :set_document, only: [:edit, :update, :destroy ]

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
      redirect_to procedure_path(@procedure), notice: "El documento #{@document.name} ha sido cargado."
    else
      render "new"
    end
  end

  def edit

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
    puts step_name
    unless @procedure.nil?
      step = @procedure.workflows.first.steps.where(name: step_name).first
      unless step.nil?
        step.start!
      end
    end
  end
 

end
