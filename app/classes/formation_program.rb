class FormationProgram < SystemProcedure
  include EmailService

  def initialize     
    self.name = "Programa de Formación Especial"
    self.code = "T-SPF200"
  end
  
  def generate_workflow(procedure)
    workflow = Workflow.new()
    workflow.name = "Workflow Formación Especial"
    workflow.description = "Flujo principal Formación Especial"
    workflow.is_active = true
    workflow.procedure = procedure
    if workflow.save
      generate_steps(workflow)
    else
      # Render son error notification
    end 
  end

  def generate_steps(workflow)
    create_step(workflow, "#1", "Cargar el documento con el plan de formación especial.", "Representante de Facultad")
    create_step(workflow, "#2", "Registrar docentes al plan de formación especial", "Representante de Facultad")
    create_step(workflow, "#3", "Evaluación del plan de formación.","Consejo de facultad")
    create_step(workflow, "#4", "Generar constancia de aprobación.","Consejo de departamento")
  end

  #Al solicitar la evaluacion
  def initial_requirements_valid?()
    if all_required_documents_has_attachment?
      update_procedure_elements()

      email_data = {user: self.procedure.user, template: 'initial_validation_success', procedure_name: name}
      send_email(email_data)
      users = User.with_role :representante_facultad
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
    approve_step?('#1')
    start_step('#2')
    approve_step?('#2')
    start_step('#3')
  end

  #Cuando lo aprueba un administrador
  def approve_initial_requirements?
    approve_step?('#3')
  end

  def approve_generate_approval_document_step
    start_step('#4')
    approve_step?('#4')
  end

  def approve(start_date)
    if can_be_approved?()
      self.procedure.approve! 
    end       
  end

  def can_be_approved?
    steps_approved = true
    self.procedure.steps.each do |step|
      unless step.approved?
        steps_approved = false
      end
    end
    return steps_approved
  end
  
end