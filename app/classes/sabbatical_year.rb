class SabbaticalYear < SystemProcedure
  include EmailService

  def initialize     
    self.name = "Año Sabático"
    self.code = "T-AS100"
  end
  
  def generate_workflow(procedure)
    workflow = Workflow.new()
    workflow.name = "Workflow Año Sabático"
    workflow.description = "Flujo principal del trámite Año Sabático"
    workflow.is_active = true
    workflow.procedure = procedure
    if workflow.save
      generate_steps(workflow)
    else
      # Render son error notification
    end 
  end

  def generate_steps(workflow)
    create_step(workflow, "#1", "Carga y evaluación de recaudos iniciales.","Dirección de asuntos profesorales")
    create_step(workflow, "#2", "Cargar plan de trabajo.","Consejo de departamento")
    create_step(workflow, "#3", "Cargar constancia de antigüedad.","Consejo de departamento")
    create_step(workflow, "#4", "Generar constancia de aprobación.","Consejo de departamento")
  end

  def initial_requirements_valid?()
    if all_required_documents_has_attachment? and request_day_allowed?
      update_procedure_elements()
      email_data = {user: self.procedure.user, template: 'initial_validation_success', procedure_name: name}
      send_email(email_data)
      
      users = User.with_role :asuntos_profesorales
      email_data = {owner: self.procedure.user, procedure_name: name , template: 'need_to_approve' }
      send_multiple_emails(users, email_data)
      return true
    else
      return false
    end
  end

  def request_day_allowed?
    #Primeros 3 meses del año: 
    self.procedure.created_at.between?(Date.new(Date.today.year,01,01) , Date.new(Date.today.year,03,31)) 
    return true #TODO CHANGE TO FALSE THIS IS JUST FOR TESTING
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