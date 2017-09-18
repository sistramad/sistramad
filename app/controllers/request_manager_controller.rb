class RequestManagerController < ApplicationController
    include EmailService
    before_action :set_ProfessorsTransfer, only: [:show, :complete]
    
      def index
        @professorstransfers = ProfessorsTransfer.where(state: 'in_progress').page(params[:page]).per(10)
      end
    
      def show
        
      end
    
      def show_initial_requirements
        @professorstransfer = ProfessorsTransfer.find(params[:ProfessorsTransfer])
      end

      def approve_initial_requirements
        @professorstransfer = ProfessorsTransfer.find(params[:id])
        ProfessorsTransfer_instance = get_ProfessorsTransfer_intance(@professorstransfer)
        
        if ProfessorsTransfer_instance.approve_initial_requirements? 
          flash[:success] = 'Los documentos han sido aprobados con exito.'
          render 'show'
        else
          flash[:error] = 'Imposible realizar ésta acción, error en el estado del paso.'
          render 'show_initial_requirements'
        end
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
        if step.in_progress?
          step.approve!
          send_email(@professorstransfer.user, 'step_approved')
          flash[:success] = 'Paso aprobado con exito!.'
        else
          flash[:error] = 'Imposible realizar ésta acción.'
        end
        redirect_to  admin_ProfessorsTransfer_path(@professorstransfer)
      end
    
      def complete
        steps_approved = true
        @professorstransfer.steps.each do |step|
          unless step.approved?
            steps_approved = false
          end
        end
        
        if @professorstransfer.in_progress? and steps_approved
          @professorstransfer.approve!
          flash[:success] = 'Solicitud aprobada con exito!'
          redirect_to  admin_ProfessorsTransfer_path(@professorstransfer)
        else
          flash[:error] = 'Imposible completar la solicitud, todos los pasos deben estar aprobados.'
          redirect_to  admin_ProfessorsTransfer_path(@professorstransfer) 
        end 
      end
    
      private
    
        def set_professors_transfer
            @professors_transfer = ProfessorsTransfer.find(params[:id])
        end
    
        def get_professors_transfer_intance(professors_transfer)
          instance = get_request_from_factory(professors_transfer.type_of_translate)
          instance.professors_transfer = professors_transfer
          return instance
        end
    
        def get_request_from_factory(type)
            factory = WorkflowFactory.new
            factory.build(type)
        end
      end
end
