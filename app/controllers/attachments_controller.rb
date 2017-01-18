class AttachmentsController < ApplicationController
  before_action :set_user
  before_filter :authenticate_user!
  def new
    @attachment = Attachment.new
    @documents = Document.all
    @document = Document.new
  end

  def index
    @attachments = Attachment.all
  end

  def create

    params[:attachments].each do |attachment|
      if attachment[1] != nil
        doc = attachment[1]
        if doc[:file] != nil
          @attachment = current_user.attachments.new(attachment_params(doc))
          @attachment.save
        end

      end
    end

    if @attachment.save
      redirect_to "localhost:3000"
    end

  end
  private
    def set_user
      @user = current_user
    end

  def attachment_params (document)

    document.permit(:document_id,:file)
  end

end