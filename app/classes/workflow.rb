class Workflow
    
      attr_accessor :name
      attr_accessor :type_of_translate
      attr_accessor :professors_transfer
    
      def initialize
        
      end

      def create_step(workflow, step_number,name, role_name)
        step = WorkflowStep.new(name: name, step_number: step_number, is_active: true)
        step.role = Role.find_by(name: role_name)
        step.request_workflow = workflow
        step.save
      end
    
      def approve_step?(step_number)
        step = self.professors_transfers.request_workflows.workflow_steps.where(step_number: step_number).first
        step.aprobar!
        step.update(approval_date: Time.now)
        step.aprobar?
      end
    
      def start_step(step_number)
        step = self.professors_transfers.request_workflows.workflow_steps.where(step_number: step_number).first
        step.procesar!
        step.update(approval_date: Time.now)
      end 
    
    end