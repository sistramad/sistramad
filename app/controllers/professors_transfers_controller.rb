class ProfessorsTransfersController < ApplicationController

  include EmailService

  before_action :set_professors_transfer, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_faculties, only: [:new,:edit]
  before_action :set_references, only: [:new,:edit]
  before_action :set_reference_lists, only: [:new,:edit]
  before_action :get_selections, only: [:new,:edit,:get_selections,:get_froms,:get_to]
  before_action :get_selections_dedication, only: [:new,:edit]
  before_action :get_froms, only: [:edit,:get_selections,:get_froms,:get_to]
  before_action :get_to, only: [:edit,:get_selections,:get_froms,:get_to]
  before_filter :authenticate_user!
  require 'rubygems'
  require 'zip'
  require 'tempfile'

  # GET /professors_transfers
  # GET /professors_transfers.json
  def index
    @professors_transfers = ProfessorsTransfer.where(status: 'IP').page(params[:page]).per(15)
  end

  # GET /professors_transfers/1
  # GET /professors_transfers/1.json
  def show
  end

  # GET /professors_transfers/new
  def new
    @professors_transfer = ProfessorsTransfer.new
    #@documents = FormalitiesMaster.find_by_name(params[:name]).documents
    #@user =  @professors_transfer.user
    #@attachment = Attachment.new
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
      date = @professors_transfer.user.employee.dedication_start_date
      if @professors_transfer.update(professors_transfer_params)
        if (@professors_transfer.process_type)==1
          type = Reference.find(@professors_transfer.type_of_translate).name
          actual_request = get_request_from_factory(type)
          actual_request.generate_workflow(@professors_transfer)
          actual_request.professors_transfer = @professors_transfer
          actual_request.initial_requirements_valid?  
          format.html { redirect_to @professors_transfer, notice: 'El Tramite fue solicitado correctamente.' }
          format.json { render :show, status: :ok, location: @professors_transfer }
        else
          if (validates_dedication_date(date))
            type = ReferenceList.find(@professors_transfer.type_of_translate).name
            actual_request = get_request_from_factory(type)
            actual_request.generate_workflow(@professors_transfer)
            actual_request.professors_transfer = @professors_transfer
            actual_request.initial_requirements_valid?  
            format.html { redirect_to @professors_transfer, notice: 'El Tramite fue solicitado correctamente.' }
            format.json { render :show, status: :ok, location: @professors_transfer }
          else
            format.html { render :show, notice: 'El tiempo en la Dedicación debe ser mayor a un Año' }
            format.json { render json: @professors_transfer.errors, status: :unprocessable_entity }
          end
        end
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
      format.html { redirect_to professors_transfers_url, notice: 'El Tramite fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  def download

    documentos = FormalitiesDocument.select([:document_id]).where(formalities_master_id: 1)  
    @submissions = Attachment.where(user_id: params[:user_id],document_id: documentos)

    file_origin = Rails.root.to_s+'/public'
    @user = User.find(params[:user_id])
    filename = 'recaudos_'+@user.first_name.capitalize+'_'+
    @user.middle_name.capitalize+'_'+@user.last_name.capitalize+'.zip'
    file = Tempfile.new(filename)

    begin
      Zip::OutputStream.open(file) { |zos| }

      #Añadiendo archivos al Zip
      Zip::File.open(file.path, Zip::File::CREATE) do |zipfile|
        @submissions.each do |filename|
          zipfile.add(filename.file_file_name, file_origin + filename.file.url(:original, false))
          end
      end

      zip_data = File.read(file.path)

      send_data(zip_data, :type => 'application/zip', :filename => filename)
    ensure
      #Close and delete the temp file
      file.close
      file.unlink
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professors_transfer
      @professors_transfer = ProfessorsTransfer.find(params[:id])
    end

    def set_user
       @user = current_user
    end

    def validates_dedication_date(date)
      if( date < 1.year.ago   )
        true
      else 
        false
      end
    end
      
    def set_faculties
       @faculties = current_user.employee.faculties
    end

    def set_references
      if (@professors_transfer.process_type==1)
          @reference = Reference.last(3)
      end
      if (@professors_transfer.process_type==3)
        @reference = Reference.find_by(name: 'Tipo de Cambio')
      end
    end

    def set_reference_lists
      @reference_lists = ReferenceList.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professors_transfer_params
      params.require(:professors_transfer).permit(:faculty_from_id , :faculty_to_id, :type_of_translate )
    end

    def get_selections
      if (params[:type_of_translate].present?) 
        @references = Reference.find(params[:type_of_translate])
        @reference_lists = @references.reference_lists
      else
        @references = Reference.find(9)
        @reference_lists = @references.reference_lists
      end
    end

    def get_selections_dedication
      if (params[:type_of_translate].present?) 
        @references = Reference.find(params[:type_of_translate])
        @reference_lists = @references.reference_lists
      else
        @references = Reference.find_by(name: 'Tipo de Cambio')
        @reference_lists = @references.reference_lists
        @reference_lists2 = current_user.employee.dedication_classification
        @references = Reference.find_by(name: 'Dedicacion')
        @reference_lists3 = @references.reference_lists
      end
    end

    def get_froms
      if ((params[:faculty_to_id].present?)&&(params[:type_of_translate].present?)) 
        @reference_lists = ReferenceList.where("id NOT IN (?) AND reference_id =?", params[:faculty_to_id],params[:type_of_translate])
      end
    end

    def get_to 
      if ((params[:faculty_from_id].present?)&&(params[:type_of_translate].present?)) 
        @reference_lists = ReferenceList.where("id NOT IN (?) AND reference_id =?", params[:faculty_from_id],params[:type_of_translate])
      end
    end

    def get_request_from_factory(type)
      factory = WorkflowFactory.new
      factory.build(type)
    end

end 