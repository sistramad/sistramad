class AdminProceduresController < ApplicationController
  include EmailService
  include FactoryHelper
  require 'zip'
  before_action :set_procedure, only: [:show, :complete]

  def index
    @procedures = Procedure.where(state: 'in_progress').page(params[:page]).per(10)
  end

  def show

  end

  def show_initial_requirements
    @procedure = Procedure.find(params[:procedure])
  end

  def approve_initial_requirements
    @procedure = Procedure.find(params[:id])
    procedure_instance = get_procedure_intance(@procedure)

    if procedure_instance.approve_initial_requirements?
      flash[:success] = 'Los documentos han sido aprobados con éxito.'
      render 'show'
    else
      flash[:error] = 'Imposible realizar ésta acción, error en el estado del paso.'
      render 'show_initial_requirements'
    end
  end

  def show_document
    @procedure = Procedure.find(params[:id])
    @document = @procedure.documents.find_by(code: params[:document_code])
    @step = @procedure.steps.find_by(name: params[:step])
  end

  def approve_document
    @document = Document.find(params[:id])
    @procedure = Procedure.find(procedure)
  end

  def approve_step
    @procedure = Procedure.find(params[:id])
    step = Step.find(params[:step])
    if step.in_progress?
      step.approve!
      send_email(@procedure.user, 'step_approved')
      flash[:success] = 'Paso aprobado con éxito!.'
    else
      flash[:error] = 'Imposible realizar ésta acción.'
    end
    redirect_to  admin_procedure_path(@procedure)
  end

  def complete
    procedure_instance = get_procedure_intance(@procedure)

    if @procedure.in_progress? and procedure_instance.can_complete?
      @procedure.approve!
      flash[:success] = 'Solicitud aprobada con exito!'
      redirect_to  admin_procedure_path(@procedure)
    else
      flash[:error] = 'Imposible completar la solicitud, todos los pasos deben estar aprobados.'
      redirect_to  admin_procedure_path(@procedure)
    end
  end

  def generate_approval_document
    @procedure = Procedure.find(params[:procedure]) # creo que no hace falta buscarlo en la BD
    @user = User.find(@procedure.user.id)

    if generate_pdf?(@procedure, @user)
      procedure = get_procedure_intance(@procedure)
      procedure.approve_generate_approval_document_step()
      flash[:success] = 'Constacia generada con éxito.'       
    else
      flash[:error] = 'Error al generar constacia de aprobación.'
    end
    redirect_to  admin_procedure_path(@procedure)
  end

  def download_all_documents
    procedure = Procedure.find(params[:id])    
    temp_file = Tempfile.new('all_documents.zip')
    begin
      Zip::OutputStream.open(temp_file) { |zos| }
      #Add files to the zip file as usual
      Zip::File.open(temp_file.path, Zip::File::CREATE) do |zipfile|
        procedure.documents.order(:name).each do |document|
          zipfile.add(document.attachment_identifier, document.attachment.current_path)
        end
      end
      #Read the binary data from the file
      zip_data = File.read(temp_file.path)
      send_data(zip_data, :type => 'application/zip', :filename => "AllDocuments-#{Time.now.to_date}")
    ensure
      temp_file.close
      temp_file.unlink
    end
  end

  private

    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def get_procedure_intance(procedure)
      procedure_instance = get_procedure_from_factory(procedure.code)
      procedure_instance.procedure = procedure
      return procedure_instance
    end  

    def generate_pdf?(procedure, user)
      document = Document.new(name: 'Constancia de Aprobación', code: 'CDAP')
      document.procedure = procedure
      document.user = user    
    
      pdf = render_to_string pdf: "oficio", template: 'admin_procedures/oficio', encoding: "UTF-8"

      tempfile = Tempfile.new(["#{'oficio_temp'}", ".pdf"], Rails.root.join('tmp'))
      tempfile.binmode
      tempfile.write pdf
      tempfile.close

      document.attachment = tempfile
      document.save     
    end

end
