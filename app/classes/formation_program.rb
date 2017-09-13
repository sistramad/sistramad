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
    create_step(workflow, "#2", "Incluir profesores al plan de formación especial", "Representante de Facultad")
    create_step(workflow, "#3", "Evaluacón del plan de formación.","Consejo de Facultad")
    create_step(workflow, "#4", "Generar constacia de aprobación.","Consejo de departamento")
    create_step(workflow, "#5", "Completar solicitud","Consejo Universitario")
  end

  def initial_requirements_valid?()
    if all_required_documents_has_attachment?
      update_procedure_elements()
      send_email(self.procedure.user, 'initial_validation_success')
      users = User.find_group_members('D20')
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

  def approve_initial_requirements?
    approve_step?('#1')
  end

  def approve_generate_approval_document_step
    start_step('#4')
    approve_step?('#4')
  end

  
end