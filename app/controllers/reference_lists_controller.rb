class ReferenceListsController < ApplicationController
  before_action :set_reference_list, only: [:show, :edit, :update, :destroy]

  # GET /reference_lists
  # GET /reference_lists.json
  def index
    @reference_lists = ReferenceList.all
  end

  # GET /reference_lists/1
  # GET /reference_lists/1.json
  def show
  end

  # GET /reference_lists/new
  def new
    @reference_list = ReferenceList.new
  end

  # GET /reference_lists/1/edit
  def edit
  end

  # POST /reference_lists
  # POST /reference_lists.json
  def create
    @reference_list = ReferenceList.new(reference_list_params)

    respond_to do |format|
      if @reference_list.save
        format.html { redirect_to @reference_list, notice: 'Reference list was successfully created.' }
        format.json { render :show, status: :created, location: @reference_list }
      else
        format.html { render :new }
        format.json { render json: @reference_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reference_lists/1
  # PATCH/PUT /reference_lists/1.json
  def update
    respond_to do |format|
      if @reference_list.update(reference_list_params)
        format.html { redirect_to @reference_list, notice: 'Reference list was successfully updated.' }
        format.json { render :show, status: :ok, location: @reference_list }
      else
        format.html { render :edit }
        format.json { render json: @reference_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reference_lists/1
  # DELETE /reference_lists/1.json
  def destroy
    @reference_list.destroy
    respond_to do |format|
      format.html { redirect_to reference_lists_url, notice: 'Reference list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference_list
      @reference_list = ReferenceList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reference_list_params
      params.require(:reference_list).permit(:name, :description, :value, :reference_id)
    end
end
