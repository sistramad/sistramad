class RequestManagerController < ApplicationController
    include EmailService
    before_action :set_professors_transfer, only: [:initial_requirements,:complete,:close,:decline]
    
      def index
        @professors_transfers = ProfessorsTransfer.where(status: ['IP','AP']).page(params[:page]).per(15)
      end
    
      def show
        @professors_transfer = ProfessorsTransfer.find(params[:id])
        docs = FormalitiesMaster.find_by(name: @professors_transfer.process_type.name ).documents   
        u_id = @professors_transfer.user_id
        @attachments = User.find_by(id: u_id).attachments.where(:document_id => docs)
      end
    
      def initial_requirements
        docs = FormalitiesMaster.find_by(name: @professors_transfer.process_type.name ).documents   
        u_id = @professors_transfer.user_id
        @attachments = User.find_by(id: u_id).attachments.where(:document_id => docs)
      end

      def approve_initial_requirements
        @professors_transfer = ProfessorsTransfer.find(params[:id])
        professors_transfer_instance = get_professors_transfer_instance(@professors_transfer)
        
        if professors_transfer_instance.approve_initial_requirements? 
          flash[:success] = 'Los documentos han sido aprobados con exito.'
          render 'show'
        else
          flash[:error] = 'Imposible realizar ésta acción, error en el estado del paso.'
          render 'show_initial_requirements'
        end
      end

      def generate_approval_document
        @professors_transfer = ProfessorsTransfer.find(params[:professors_transfer])
        @user = User.find(@professors_transfer.user.id)
        if generate_pdf?(@professors_transfer, @user)
          flash[:success] = 'Constancia generada con éxito.'       
        else
          flash[:error] = 'Error al generar constancia de aprobación.'
        end
        redirect_to  request_manager_path(@professors_transfer)
      end

      def show_document
        @professorstransfer = ProfessorsTransfer.find(params[:id])
        @document = @professorstransfer.documents.find_by(code: params[:document_code])
        @step = @professorstransfer.steps.find_by(name: params[:step])
      end
    
      def approve_document
        @document = Document.find(params[:id])
        @professorstransfer = ProfessorsTransfer.find(ProfessorsTransfer)
      end
    
      def approve_step
        @professorstransfer = ProfessorsTransfer.find(params[:id])
        step = Step.find(params[:step])
        if step.IP?
          step.aprobar!
          send_email(@professorstransfer.user, 'step_approved')
          flash[:success] = 'Paso aprobado con exito!.'
        else
          flash[:error] = 'Imposible realizar ésta acción.'
        end
        redirect_to  request_manager_path(@professorstransfer)
      end
    
      def complete
        steps_approved = true
        professors_transfer = get_professors_transfer_instance(@professors_transfer)
        professors_transfer.approve_final_step()
        @professors_transfer.workflow_steps.each do |step|
          unless step.AP?
            steps_approved = false
          end
        end
        
        if @professors_transfer.IP? and steps_approved
          @professors_transfer.aprobar!
          flash[:success] = 'Solicitud aprobada con exito!'
          redirect_to  request_manager_path(@professors_transfer)
        else
          flash[:error] = 'Imposible completar la solicitud, todos los pasos deben estar aprobados.'
          redirect_to  request_manager_path(@professors_transfer) 
        end 
      end

      def close
        steps_approved = true
        @professors_transfer.workflow_steps.each do |step|
          unless step.AP?
            steps_approved = false
          end
        end
        
        if @professors_transfer.AP? and steps_approved
          @professors_transfer.completar!
          flash[:success] = 'Solicitud cerrada con exito!'
          redirect_to  request_manager_path(@professors_transfer)
        else
          flash[:error] = 'Imposible cerrar la solicitud, todos los pasos deben estar aprobados.'
          redirect_to  request_manager_path(@professors_transfer) 
        end 
      end

      def decline
        steps_approved = true
        professors_transfer = get_professors_transfer_instance(@professors_transfer)
        professors_transfer.decline_final_step()
        @professors_transfer.workflow_steps.each do |step|
          unless step.AP?
            steps_approved = false
          end
        end
        
        if @professors_transfer.IP? and !steps_approved
          @professors_transfer.declinar!
          flash[:error] = 'Solicitud no cumplio con requisitos, Ha sido Rechazada!'
          redirect_to  request_manager_path(@professors_transfer)
        else
          flash[:error] = 'Imposible declinar la solicitud, todos los pasos deben estar aprobados.'
          redirect_to  request_manager_path(@professors_transfer) 
        end 
      end
    
      private
    
        def set_professors_transfer
            @professors_transfer = ProfessorsTransfer.find(params[:id])
        end
    
        def get_professors_transfer_instance(professors_transfer)
          type = Reference.find(@professors_transfer.type_of_translate).name
          instance = get_request_from_factory(type)
          instance.professors_transfer = professors_transfer
          return instance
        end
    
        def get_request_from_factory(type)
            factory = WorkflowFactory.new
            factory.build(type)
        end

        def generate_pdf?(professors_transfer, user)
          attachment = Attachment.new
          type = FormalitiesMaster.find_by(id: 1)
          if ( professors_transfer.process_type == type)
            attachment.document = Document.find_by(name: 'Copia de Oficio de Aprobación de Traslado')
            attachment.process_id = professors_transfer
          else
            attachment.document = Document.find_by(name: 'Copia de Oficio de Aprobacion de Cambio en Dedicacion')
            attachment.process_id = professors_transfer
          end  
          attachment.user = user    
        
          pdf = render_to_string pdf: "traslado_aprobacion", template: 'request_manager/traslado_aprobacion', encoding: "UTF-8"
    
          tempfile = Tempfile.new(["#{'traslado_aprobacion_temp'}", ".pdf"], Rails.root.join('tmp'))
          tempfile.binmode
          tempfile.write pdf
          
    
          attachment.file = tempfile
          tempfile.close
          attachment.save     
        end

      end
