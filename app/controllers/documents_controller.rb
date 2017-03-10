class DocumentsController < ApplicationController
  before_action :set_document, only: [:edit, :update, :destroy ]

 def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to documents_path, notice: "The Document #{@document.name} has been uploaded."
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
    params.fetch(:document, {}).permit(:name, :attachment)
  end

  def set_document
    @document = Document.find(params[:id])
  end

end
