class FinalReport < SystemProcedure
  include EmailService
  
  def initialize     
    @name = "Aprobación de Informe Final de Actividades"
    @code = "T-AS103"
  end
  
  def generate_workflow(procedure)
    workflow = Workflow.new()
    workflow.name = "Aprobación de Informe Final de Actividades"
    workflow.description = "Flujo principal del trámite Aprobación de Informe Final de Actividades"
    workflow.is_active = true
    workflow.procedure = procedure
    if workflow.save
      generate_steps(workflow)
    else
      # Render son error notification
    end 
  end

  def generate_steps(workflow)
    create_step(workflow, "#1", "Evaluación del Informe Final.","Consejo de departamento")
    create_step(workflow, "#2", "Generar constancia de aprobación del Informe Final.","Consejo de departamento")
  end

  def initial_requirements_valid?()
    if all_required_documents_has_attachment?
      update_procedure_elements()

      email_data = {user: self.procedure.user, template: 'initial_validation_success', procedure_name: name}
      send_email(email_data)
      
      users = User.with_role :consejo_departamento
      email_data = {owner: self.procedure.user, procedure_name: name , template: 'need_to_approve' }
      send_multiple_emails(users, email_data)     
      
      return true
    else
      return false
    end
  end

  def update_procedure_elements()
    self.procedure.start! 
    start_step('#1')
  end

  def approve_initial_requirements?
    approve_step?('#1')
  end

  def approve_generate_approval_document_step
    start_step('#2')
    approve_step?('#2')
  end

  def approve(start_date)
    if can_be_approved?()
      self.procedure.approve!
    end       
  end

  def can_be_approved?()
    step_approved?('#1')
  end

  def step_approved?(step_name)
    self.procedure.steps.find_by(name: "#{step_name}").approved?
  end 
  
end