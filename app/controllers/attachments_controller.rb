class AttachmentsController < ApplicationController
  before_action :set_user
  before_filter :authenticate_user!

  def new
    @attachment = Attachment.new
    #Aqui se mostraran documentos dependiendo del trámite hay que pasar el parámetro del trámite
    @documents = FormalitiesMaster.find_by_name(params[:name]).documents
    @document = Document.new

  end

  def index
    @attachments = Attachment.all
  end

  def create_inform

    a = params[:attachment]
    @attachment = Attachment.new(inform_params)

    if @attachment.save
      redirect_to informs_joint_plans_path
    end

  end


  def create

    inform = false
    a = params[:attachments]
    a.each do |attachment|
      if attachment[1] != nil
        doc = attachment[1]
        if doc[:file] != nil
          @attachment = current_user.attachments.new(attachment_params(doc))
          @attachment.save
          if doc[:document_id] == '16' || doc[:document_id] == '17'
            inform = true
          end
        end

      end
    end

    if @attachment.save && !inform
      redirect_to "localhost:3000"
    else
      redirect_to informs_joint_plans_path , notice: "Informe subido exitosamente"
    end

  end
  private
    def set_user
      @user = current_user
    end

  def attachment_params (document)

    document.permit(:document_id,:file)
  end

  def attachment_params (formalities_master)

    formalities_master.permit(:name,:table_manager)
  end

end