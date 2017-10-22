class FormalitiesDocumentsController < ApplicationController
  before_action :set_formalities_document, only: [:show, :edit, :update, :destroy]

  # GET /formalities_documents
  # GET /formalities_documents.json
  def index
    @formalities_documents = FormalitiesDocument.all.page(params[:page]).per(15)
  end

  # GET /formalities_documents/1
  # GET /formalities_documents/1.json
  def show
  end

  # GET /formalities_documents/new
  def new
    @formalities_document = FormalitiesDocument.new
  end

  # GET /formalities_documents/1/edit
  def edit
  end

  # POST /formalities_documents
  # POST /formalities_documents.json
  def create
    @formalities_document = FormalitiesDocument.new(formalities_document_params)

    respond_to do |format|
      if @formalities_document.save
        format.html { redirect_to @formalities_document, notice: 'Formalities document was successfully created.' }
        format.json { render :show, status: :created, location: @formalities_document }
      else
        format.html { render :new }
        format.json { render json: @formalities_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formalities_documents/1
  # PATCH/PUT /formalities_documents/1.json
  def update
    respond_to do |format|
      if @formalities_document.update(formalities_document_params)
        format.html { redirect_to @formalities_document, notice: 'Formalities document was successfully updated.' }
        format.json { render :show, status: :ok, location: @formalities_document }
      else
        format.html { render :edit }
        format.json { render json: @formalities_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formalities_documents/1
  # DELETE /formalities_documents/1.json
  def destroy
    @formalities_document.destroy
    respond_to do |format|
      format.html { redirect_to formalities_documents_url, notice: 'Formalities document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formalities_document
      @formalities_document = FormalitiesDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formalities_document_params
      params.require(:formalities_document).permit(:formalities_master_id, :document_id)
    end
end
