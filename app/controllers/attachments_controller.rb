class AttachmentsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  def new
    @attachment = Attachment.new
    @documents = JointplanDocument.where(typedoc: 1)
    @document = JointplanDocument.new
    @joint_plan = JointPlan.new
  end

  def index
    @attachments = Attachment.all
  end



  def create

    inform = false
    a = params.to_unsafe_h.slice(:attachments)
    joint_plan_params = params.to_unsafe_h.slice(:joint_plan)
    a.each do |attachment|
      if attachment[1] != nil
        attach = attachment[1]
        attach.each do |doc|
          if doc[1][:file] != nil
            @attachment = current_user.attachments.new(attachment_params(doc[1]))
            @attachment.save
            #if doc[1][:document_id] == '16' || doc[1][:document_id] == '17'
            #  inform = true
            #end
          end
        end
      end
    end

    #if @attachment.save && !inform
      #jointPlan = JointPlan.new(:name => 'Plan Conjunto',:user_id=>current_user.id,:status=>1,:begin_plan => joint_plan_params[:joint_plan][:begin_plan],:end_plan=>joint_plan_params[:joint_plan][:end_plan])
      #jointPlan.save
      #redirect_to request.referrer, notice: "Archivo subido exitosamente"
    #else
      redirect_to inform_joint_plans_path , notice: "Informe subido exitosamente"
    #end

  end
  private
    def set_user
      @user = current_user
    end


  def attachment_params (document)

    ActionController::Parameters.new(document).permit(:document_id,:file,:joint_plan_id)
  end

end