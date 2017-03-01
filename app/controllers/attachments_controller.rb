class AttachmentsController < ApplicationController
  before_action :set_user
  before_action :set_attachment, only: [:edit,:update]
  before_action :set_formalities_master, only: [:edit]
  before_filter :authenticate_user!

  def new
    @attachment = Attachment.new
    #Aqui se mostraran documentos dependiendo del trámite hay que pasar el parámetro del trámite
    @documents = FormalitiesMaster.find_by_name(params[:tramite]).documents
    @formalities_masters = FormalitiesMaster.find_by_name(params[:tramite])
    @document = Document.new
  end

  def index
    @attachments = Attachment.all
  end

  def edit

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
    uploads = params[:tramite][:docs_uploaded].to_i
    a = params[:attachments]
    a.each do |attachment|
      if attachment[1] != nil
        doc = attachment[1]
        if doc[:file] != nil
            uploads += 1
            @attachment = current_user.attachments.new(attachment_params(doc))
            @attachment.save
          if doc[:document_id] == '16' || doc[:document_id] == '17'
            inform = true
          end
        end

      end
    end

    if @attachment.save && !inform
      instance =FormalitiesMaster.find_by_name(params[:tramite][:name]).table_manager.classify.constantize
      if (!instance.exists?(user_id: current_user.id))
        @instance =  instance.new(user_id: current_user.id,name: params[:tramite][:name])
        if ((params[:tramite][:docs].to_i == uploads) && (params[:tramite][:name]== "Traslados"))
          @instance.procesar
        end
          respond_to do |format|
              if @instance.save
                  format.html { redirect_to @instance, notice: 'El Trámite se Solicito Correctamente.' }
                  format.json { render :show, status: :created, location: @instance }
              else
                 format.html { render :new }
                 format.json { render json: @instance.errors, status: :unprocessable_entity }
              end
          end
      else
        @instance = instance.find_by(user_id: current_user.id)
        if ((params[:tramite][:docs].to_i == uploads) && (params[:tramite][:name]== "Traslados"))
          @instance.procesar
          @instance.save
        end
        redirect_to @instance , notice: "SE Actualizo estado de Trámite"
      end      
    else
      redirect_to informs_joint_plans_path , notice: "Informe subido exitosamente"
    end
  end

  def update
    doc = params[:attachment]
    if doc[:document_id] != nil
        if doc[:file] != nil
            respond_to do |format|
              if @attachment.update(attachment_params(doc))
                format.html { redirect_to new_attachment_path(:tramite => params[:tramite][:name]) , 
                notice: 'El Recaudo se Actualizo Correctamente.' }
                format.json { render :show, status: :ok, location: @attachment }
              else
                format.html { render :edit }
                format.json { render json: @attachment.errors, status: :unprocessable_entity }
              end
            end
        end
    end        
  end
  
  private
    def set_user
      @user = current_user
    end
    
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    def set_formalities_master
      @formalities_master = FormalitiesMaster.find_by_id(params[:format])
    end

  def attachment_params (document)
    document.permit(:document_id,:file)
  end


end