class ModifyWorkplan < SystemProcedure
  include EmailService  

  def initialize     
    self.name = "Modificación de Plan de Trabajo"
    self.code = "T-AS101"
  end
  
  def generate_workflow(procedure)
    workflow = Workflow.new()
    workflow.name = "Modificación de Plan de Trabajo"
    workflow.description = "Flujo principal del trámite Modificación de Plan de Trabajo"
    workflow.is_active = true
    workflow.procedure = procedure
    if workflow.save
      generate_steps(workflow)
    else
      # Render son error notification
    end 
  end

  def generate_steps(workflow)
    create_step(workflow, "#1", "Evaluación del plan de trabajo modificado.","Consejo de departamento")
    create_step(workflow, "#2", "Evaluación del documento probatorio de la modificación.","Consejo de departamento")
    create_step(workflow, "#3", "Generar documento de aprobación de la modificación.","Consejo de departamento")
  end

  def initial_requirements_valid?()
    if all_required_documents_has_attachment?
      update_procedure_elements()
      send_email(self.procedure.user, 'initial_validation_success')
      users = User.find_group_members('C10')
      send_emails(users,'need_to_approve')
      return true
    else
      return false
    end
  end

  def update_procedure_elements()
    self.procedure.start! 
    start_step('#1')
    start_step('#2')
  end

  def approve_initial_requirements?
    approve_step?('#1') and approve_step?('#2')
  end

  def approve_generate_approval_document_step
    start_step('#3')
    approve_step?('#3')
  end

  def can_complete?
    steps_approved = true
    self.procedure.steps.each do |step|
      unless step.approved?
        steps_approved = false
      end
    end
    return steps_approved
  end
  
end