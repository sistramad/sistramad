class ModifyWorkplan < SystemProcedure
  attr_accessor :name
  attr_accessor :code
  @procedure
  @required_documents

  def initialize     
    @name = "Modificación de Plan de Trabajo"
    @code = "T-AS101"
    @required_documents = { PDTM: "Plan de Trabajo Modificado", DPDM: "Documento Probatorio de Modificación"}
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
    create_step(workflow, "#1", "Carga y evaluación de Plan de Trabajo Modificado.","Consejo de departamento")
    create_step(workflow, "#2", "Carga y evaluación del Documento Probatorio de Modificación.","Consejo de departamento")
  end

  def create_step(workflow, name, description, group_name)
    step = Step.new(name: name, description: description, is_active: true)
    step.group = Group.find_by(name: group_name)
    step.workflow = workflow
    step.save
  end

  def initial_requirements_valid?(procedure)   
    @procedure = procedure 
    if all_required_documents_has_attachment?
      update_procedure_elements(@procedure)
      send_email(@procedure.user, 'initial_validation_success')
      users = User.find_group_members('C10')
      send_emails(users,'need_to_approve')
      return true
    else
      return false
    end
  end

  def all_required_documents_has_attachment?
    @procedure.documents.each do |doc|
      if !doc.attachment.present? and @required_documents.has_value?(doc.name)
        return false
      end 
    end
  end

  def update_procedure_elements(procedure)
    procedure.start! 
    start_step(procedure,'#1')
    start_step(procedure,'#2')
  end

  def start_step(procedure, name)
    step = procedure.workflows.first.steps.where(name: name).first
    step.start!
    step.update(approved_at: Time.now)
  end 
  
end