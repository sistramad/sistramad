class AttachmentsController < ApplicationController
  before_action :set_user
  before_action :set_attachment, only: [:edit,:update,:download]
  before_action :set_formalities_master, only: [:edit]
  before_filter :authenticate_user!

  def new
    @attachment = Attachment.new
    #Aqui se mostraran documentos dependiendo del trámite hay que pasar el parámetro del trámite
    @documents = FormalitiesMaster.find_by(id: params[:tramite]).documents
    @formalities_master = FormalitiesMaster.find_by(id: params[:tramite])
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
    docsToUpload= params[:tramite][:docs].to_i
    a = params[:attachments]
    if (docsToUpload != uploads )
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
    end  

    if (docsToUpload != uploads)
      if @attachment.save && !inform
        instance =FormalitiesMaster.find_by_name(params[:tramite][:name]).table_manager.classify.constantize
        if ((!instance.exists?(user_id: current_user.id))&&(!instance.exists?(process_type: params[:tramite])))
          formalities_master = FormalitiesMaster.find_by(id: params[:tramite][:id])
          @instance =  instance.new(user_id: current_user.id,name: formalities_master.name, process_type: formalities_master)
          if (params[:tramite]== 1)
            if (params[:tramite][:docs].to_i == uploads) 
              @instance.procesar
            end
            respond_to do |format|
              if @instance.save
                  format.html { redirect_to edit_professors_transfer_path (@instance), 
                    notice: 'Para terminar de Solicitar indique Facultad de Origen y Destino.' }
                  format.json { render :show, status: :created, location: @instance }
              else
                format.html { render :new }
                format.json { render json: @instance.errors, status: :unprocessable_entity }
              end
            end
          elsif (params[:tramite]== 3)
            if (params[:tramite][:docs].to_i == uploads)   
              @instance.procesar
            end
            respond_to do |format|
              if @instance.save
                  format.html { redirect_to edit_professors_transfer_path (@instance), 
                    notice: 'Para terminar de Solicitar indique Facultad de Origen y Destino.' }
                  format.json { render :show, status: :created, location: @instance }
              else
                format.html { render :new }
                format.json { render json: @instance.errors, status: :unprocessable_entity }
              end
            end  
          else
            respond_to do |format|
                if @instance.save
                    format.html { redirect_to @instance, notice: 'El Trámite se Solicito Correctamente.' }
                    format.json { render :show, status: :created, location: @instance }
                else
                  format.html { render :new }
                  format.json { render json: @instance.errors, status: :unprocessable_entity }
                end
            end
          end  
        else
          @instance = instance.find_by(user_id: current_user.id, process_type: params[:tramite])
          if ((params[:tramite][:docs].to_i == uploads) && ((params[:tramite]==1)||(params[:tramite]==3)))
            @instance.procesar
            @instance.save
          end
          redirect_to @instance , notice: "Se Actualizo estado de Trámite"
        end      
      else
        redirect_to informs_joint_plans_path , notice: "Informe subido exitosamente"
      end
    elsif (docsToUpload == uploads)
      instance =FormalitiesMaster.find_by(id: params[:tramite][:id]).table_manager.classify.constantize
      if (instance.find_by(user_id: current_user.id,process_type: params[:tramite][:id]).nil?)
        formalities_master = FormalitiesMaster.find_by(id: params[:tramite][:id])
        @instance =  instance.new(user_id: current_user.id,name: formalities_master.name, process_type: formalities_master)
        if (formalities_master.id==1)
          if (params[:tramite][:docs].to_i == uploads) 
            @instance.procesar
          end
          respond_to do |format|
            if @instance.save
                format.html { redirect_to edit_professors_transfer_path (@instance),notice: 'Para terminar de Solicitar indique Facultad de Origen y Destino.' }
                format.json { render :show, status: :created, location: @instance }
            else
              format.html { render :new }
              format.json { render json: @instance.errors, status: :unprocessable_entity }
            end
          end
        elsif (formalities_master.id==3)
          if (params[:tramite][:docs].to_i == uploads) 
            @instance.procesar
          end
          respond_to do |format|
            if @instance.save
                format.html { redirect_to edit_professors_transfer_path (@instance) }
                format.json { render :show, status: :created, location: @instance }
            else
              format.html { render :new }
              format.json { render json: @instance.errors, status: :unprocessable_entity }
            end
          end
        else
          respond_to do |format|
              if @instance.save
                  format.html { redirect_to @instance, notice: 'El Trámite se Solicito Correctamente.' }
                  format.json { render :show, status: :created, location: @instance }
              else
                format.html { render :new }
                format.json { render json: @instance.errors, status: :unprocessable_entity }
              end
          end
        end  
      else
        @instance = instance.find_by(user_id: current_user.id, process_type: params[:tramite][:id])
        if ((params[:tramite][:docs].to_i == uploads) && ((params[:tramite][:id]== 1)||(params[:tramite][:id]== 3)))
          @instance.procesar
          @instance.save
        end
        redirect_to @instance , notice: "Se Actualizo estado de Trámite"
      end 
    end  
  end

  def update
    doc = params[:attachment]
    if doc[:document_id] != nil
        if doc[:file] != nil
            respond_to do |format|
              if @attachment.update(attachment_params(doc))
                format.html { redirect_to new_attachment_path(:tramite => params[:tramite]) , 
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
  
  def download
    
        file_origin = Rails.root.to_s+'/public'
        @user = User.find(params[:user_id])
        filename = @attachment.document.name+'_'+@user.first_name.capitalize+'_'+
        @user.middle_name.capitalize+'_'+@user.last_name.capitalize+'.zip'
        file = Tempfile.new(filename)
    
        begin
          Zip::OutputStream.open(file) { |zos| }
    
          #Añadiendo archivos al Zip
          Zip::File.open(file.path, Zip::File::CREATE) do |zipfile|
              zipfile.add(@attachment.file_file_name, file_origin + @attachment.file.url(:original, false))
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