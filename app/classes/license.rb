class License < SystemProcedure
  include EmailService

  def initialize     
    self.name = "Licencia"
    self.code = "T-SLR204"
  end
  
  def generate_workflow(procedure)
    workflow = Workflow.new()
    workflow.name = "Workflow Licencia"
    workflow.description = "Flujo principal Licencia"
    workflow.is_active = true
    workflow.procedure = procedure
    if workflow.save
      generate_steps(workflow)
    else
      # Render son error notification
    end 
  end

  def generate_steps(workflow)
    create_step(workflow, "#1", "Cargar todos documentos requeridos.", "Jefe de Departamento")
    create_step(workflow, "#2", "Seleccionar el tipo y duración de la licencia.", "Jefe de Departamento")
    create_step(workflow, "#3", "Evaluación de los recaudos de la licencia.","Director de Departamento")
    create_step(workflow, "#4", "Generar constancia de aprobación","")
    create_step(workflow, "#5", "Aprobar solicitud","")
  end

  #Al momento de solicitar la evaluación de la solicitud
  def initial_requirements_valid?()
    if all_required_documents_has_attachment? and self.procedure.license_info.present?
      update_procedure_elements()
      email_data = {user: self.procedure.user, template: 'initial_validation_success', procedure_name: name}
      send_email(email_data)
      
      users = User.with_role :jefe_departamento
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
    set_group_resposible_for_step("#4")
    set_group_resposible_for_step("#5")
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
    if can_be_approved?(start_date)
      approve_procedure(start_date)
    end       
  end

  def can_be_approved?(start_date)
    step_approved?('#1') &&  step_approved?('#2') && step_approved?('#3') && step_approved?('#4') && start_date_valid(start_date)
  end

  def step_approved?(step_name)
    self.procedure.steps.find_by(name: "#{step_name}").approved?
  end 

  def start_date_valid(start_date)
    start_date.present? && (Date.parse(start_date) >= Date.today)
  end

  def approve_procedure(start_date)
    self.procedure.start_date = Date.parse(start_date)
    self.procedure.end_date = self.procedure.start_date + (self.procedure.license_period.days).days
    if self.procedure.start_date.present? && self.procedure.end_date.present?
      start_step('#5')
      approve_step?('#5')
      self.procedure.approve! 
    end
  end

  def can_be_modified?
    Date.today < (self.procedure.start_date - 90.days) #si la fecha de la solicitud de modificacion esta 3 meses antes de la fecha del comienzo del plan
  end

  def can_be_delayed?
    sub_procedures = self.procedure.sub_procedures.where(code: "T-SPL205", state: ["in_draft","in_progress"]) #tramites de prorroga hijos
    return sub_procedures.size > 0 ? false : true
  end

  def can_be_reincorporated?
    sub_procedures = self.procedure.sub_procedures.where(code: "T-SRL206", state: ["in_draft","in_progress"]) #tramites de reincorporacion hijos
    if self.procedure.end_date.present?
      return sub_procedures.size > 0 || (self.procedure.end_date + 30.days <= Date.today) ? false : true
    else
      return false
    end
  end

  def set_group_resposible_for_step(step_name)
    step = self.procedure.steps.find_by(name: "#{step_name}")
    step.group_id = find_group_by_license_period()
    step.save
  end
  
  def find_group_by_license_period()
    case self.procedure.license_period.code
      when "1" then 
        return  Group.find_by(code: "D50").id
      when "2" then 
        return  Group.find_by(code: "D40").id
      when "3" then
        return  Group.find_by(code: "C20").id
      when "4" then
        return  Group.find_by(code: "C30").id
    end
  end

end