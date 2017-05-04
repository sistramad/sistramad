class DelaySabbaticalYear < SystemProcedure
  include EmailService

  def initialize     
    @name = "Diferimiento de Año Sabatico"
    @code = "T-AS104"
  end
  
  def generate_workflow(procedure)
    workflow = Workflow.new()
    workflow.name = "Diferimiento de Año Sabatico"
    workflow.description = "Flujo principal del trámite Diferimiento de Año Sabatico"
    workflow.is_active = true
    workflow.procedure = procedure
    if workflow.save
      generate_steps(workflow)
    else
      # Render son error notification
    end 
  end

  def generate_steps(workflow)
    create_step(workflow, "#1", "Evaluación del oficio de la solicitud de diferimiento.","Consejo de facultad")
    create_step(workflow, "#2", "Generar y Aprobar oficio de Aprobación del Diferimiento.","Consejo de departamento")
  end

  def initial_requirements_valid?()
    if all_required_documents_has_attachment?
      update_procedure_elements()
      send_email(self.procedure.user, 'initial_validation_success')
      users = User.find_group_members('C20')
      send_emails(users,'need_to_approve')
      return true
    else
      return false
    end
  end

  def update_procedure_elements()
    self.procedure.start! 
    start_step('#1')
  end

  
end