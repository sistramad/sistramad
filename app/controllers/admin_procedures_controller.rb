class AdminProceduresController < ApplicationController
  include EmailService
  include FactoryHelper
  require 'zip'
  before_action :set_procedure, only: [:show, :complete, :approve_procedure, :deny_step]
  before_action :set_user

  def index
    @procedures = Procedure.where(state: 'in_progress').page(params[:page]).per(10)
  end

  def show

  end

  def show_initial_requirements
    @procedure = Procedure.find(params[:procedure])
  end

  def check_initial_requirements
    @procedure = Procedure.find(params[:procedure])
    @step = Step.find(params[:step_id])
  end

  def save_opinion
    @procedure = Procedure.find(params[:procedure])
    @step = Step.find(params[:step_id])
    @step.info = params[:info]
    @step.save

    if @step.in_draft?
      @step.start!
      users = User.with_role :director_departamento
      email_data = {owner: @procedure.user, procedure_name: @procedure.name, info: @step.info, template: 'check_comments_and_approve'}
      send_multiple_emails(users, email_data)
      redirect_to admin_procedure_path(@procedure), notice: 'Comentarios guardados con exito. Notificación enviada.'
    else
      flash[:error] = 'Imposible realizar ésta acción.'
      redirect_to admin_procedure_path(@procedure)
    end
  end

  def approve_initial_requirements
    @procedure = Procedure.find(params[:id])
    procedure_instance = get_procedure_intance(@procedure)

    if procedure_instance.approve_initial_requirements?
      email_data = {user: @procedure.user, procedure_name: @procedure.name, template: 'step_approved'}
      send_email(email_data)
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
      step.update(approved_at: Time.now)
      email_data = {user: @procedure.user, procedure_name: @procedure.name, template: 'step_approved'}
      send_email(email_data)
      flash[:success] = 'Paso aprobado con éxito!.'
    else
      flash[:error] = 'Imposible realizar ésta acción.'
    end
    redirect_to  admin_procedure_path(@procedure)
  end

  def approve_procedure
    date = params[:date]
    procedure_instance = get_procedure_intance(@procedure)
    procedure_instance.approve(date)

    if @procedure.approved?
      email_data = {user:@procedure.user, owner: @procedure.user, procedure_name: @procedure.name, responsable: @user, template: 'procedure_approved'}
      send_email(email_data)
      flash[:success] = 'Solicitud aprobada con exito!'
      redirect_to  admin_procedure_path(@procedure)
    else
      flash[:error] = 'Error al aprobar solicitud, pasos incompletos o datos faltantes.'
      redirect_to  admin_procedure_path(@procedure)
    end
   
  end

  def complete
    start_date = params[:start_date]
    procedure_instance = get_procedure_intance(@procedure)

    if @procedure.in_progress? and procedure_instance.can_complete?(start_date)
      if start_date.present? 
        @procedure.start_date = start_date
        @procedure.save
      end
      flash[:success] = 'Solicitud aprobada con exito!'
      redirect_to  admin_procedure_path(@procedure)
    else
      flash[:error] = 'Error al aprobar solicitud, pasos incompletos o datos faltantes.'
      redirect_to  admin_procedure_path(@procedure)
    end
  end

  def generate_approval_document
    @procedure = Procedure.find(params[:procedure]) # creo que no hace falta buscarlo en la BD
    @user = User.find(@procedure.user.id)

    if generate_pdf?(@procedure, @user)
      procedure = get_procedure_intance(@procedure)
      procedure.approve_generate_approval_document_step()
      flash[:success] = 'Constancia generada con éxito.'       
    else
      flash[:error] = 'Error al generar constancia de aprobación.'
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
          if document.attachment_url
            zipfile.add(document.attachment_identifier, document.attachment.current_path)
          end
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

  def deny_step
    procedure = get_procedure_intance(@procedure)

    owner = @procedure.user
    responsable_fullname = "#{@user.first_name} #{@user.last_name}"

    if procedure.deny_step(owner, responsable_fullname)
      flash[:success] = 'Tŕamite denegado, los documentos no fueron aprobados.'
      redirect_to admin_procedures_path
    end
  end

  private

    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def set_user
      @user = User.find(current_user.id)
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
