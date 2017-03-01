class ProfessorsTransfersController < ApplicationController
  
  #before_action :set_professors_transfer, only: [:show, :edit, :update, :destroy]
  
  before_filter :authenticate_user!
  require 'rubygems'
  require 'zip'
  require 'tempfile'

  # GET /professors_transfers
  # GET /professors_transfers.json
  def index
    @professors_transfers = ProfessorsTransfer.all
  end

  # GET /professors_transfers/1
  # GET /professors_transfers/1.json
  def show
    @professors_transfer = ProfessorsTransfer.find(params[:id])
  end

  # GET /professors_transfers/new
  def new
    @professors_transfer = ProfessorsTransfer.new
    @documents = FormalitiesMaster.find_by_name(params[:name]).documents
    @user =  @professors_transfer.user
    @attachment = Attachment.new
  end

  # GET /professors_transfers/1/edit
  def edit
  end

  # POST /professors_transfers
  # POST /professors_transfers.json
  def create
    @professors_transfer = ProfessorsTransfer.new(professors_transfer_params)

    respond_to do |format|
      if @professors_transfer.save
        format.html { redirect_to @professors_transfer, notice: 'Professors transfer was successfully created.' }
        format.json { render :show, status: :created, location: @professors_transfer }
      else
        format.html { render :new }
        format.json { render json: @professors_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professors_transfers/1
  # PATCH/PUT /professors_transfers/1.json
  def update
    respond_to do |format|
      if @professors_transfer.update(professors_transfer_params)
        format.html { redirect_to @professors_transfer, notice: 'Professors transfer was successfully updated.' }
        format.json { render :show, status: :ok, location: @professors_transfer }
      else
        format.html { render :edit }
        format.json { render json: @professors_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professors_transfers/1
  # DELETE /professors_transfers/1.json
  def destroy
    @professors_transfer.destroy
    respond_to do |format|
      format.html { redirect_to professors_transfers_url, notice: 'Professors transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professors_transfer
      @professors_transfer = ProfessorsTransfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professors_transfer_params
      params.require(:professors_transfer).permit(:name, :status, :user_id, :isactive, :processed, :isapproved)
    end
end
