class FormalitiesMastersController < ApplicationController
  before_action :set_formalities_master, only: [:show, :edit, :update, :destroy]

  # GET /formalities_masters
  # GET /formalities_masters.json
  def index
    #.page es necesario para paginar
    @formalities_masters = FormalitiesMaster.all.page(params[:page]).per(10)
  end

  # GET /formalities_masters/1
  # GET /formalities_masters/1.json
  def show
  end

  # GET /formalities_masters/new
  def new
    @formalities_master = FormalitiesMaster.new
  end

  # GET /formalities_masters/1/edit
  def edit
  end

  # POST /formalities_masters
  # POST /formalities_masters.json
  def create
    @formalities_master = FormalitiesMaster.new(formalities_master_params)

    respond_to do |format|
      if @formalities_master.save
        format.html { redirect_to @formalities_master, notice: 'Formalities master was successfully created.' }
        format.json { render :show, status: :created, location: @formalities_master }
      else
        format.html { render :new }
        format.json { render json: @formalities_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formalities_masters/1
  # PATCH/PUT /formalities_masters/1.json
  def update
    respond_to do |format|
      if @formalities_master.update(formalities_master_params)
        format.html { redirect_to @formalities_master, notice: 'Formalities master was successfully updated.' }
        format.json { render :show, status: :ok, location: @formalities_master }
      else
        format.html { render :edit }
        format.json { render json: @formalities_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formalities_masters/1
  # DELETE /formalities_masters/1.json
  def destroy
    @formalities_master.destroy
    respond_to do |format|
      format.html { redirect_to formalities_masters_url, notice: 'Formalities master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formalities_master
      @formalities_master = FormalitiesMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formalities_master_params
      params.require(:formalities_master).permit(:name, :description, :table_manager, :isactive)
    end
end
