class AttachmentsController < ApplicationController
  before_action :set_user
  before_filter :authenticate_user!
  def new
    @attachment = Attachment.new
    @documents = Document.where(typedoc: 1)
    @document = Document.new
  end

  def index
    @attachments = Attachment.all
  end



  def create

    inform = false
    a = params.to_unsafe_h.slice(:attachments)
    a.each do |attachment|
      if attachment[1] != nil
        attach = attachment[1]
        attach.each do |doc|
          if doc[1][:file] != nil
            @attachment = current_user.attachments.new(attachment_params(doc[1]))
            @attachment.save
            if doc[1][:document_id] == '16' || doc[1][:document_id] == '17'
              inform = true
            end
          end
        end
      end
    end

    if @attachment.save && !inform
      redirect_to "localhost:3000"
    else
      redirect_to inform_joint_plans_path , notice: "Informe subido exitosamente"
    end

  end
  private
    def set_user
      @user = current_user
    end


  def attachment_params (document)

    ActionController::Parameters.new(document).permit(:document_id,:file,:joint_plan_id)
  end

end