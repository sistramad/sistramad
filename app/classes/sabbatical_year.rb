class SabbaticalYear
  include EmailService

  attr_accessor :name
  attr_accessor :code
  attr_accessor :procedure

  @required_documents

  def initialize     
    @name = "Año Sabatico"
    @code = "T-AS100"
    @required_documents = { CI: "Cédula de Identidad", RIF: "Año Sabatico", CAC: "Carta de Aceptación", 
                            UAS: "Ultimo ascenso", SCU: "Sintesis curricular", SBI: "Solvencia Biblioteca", 
                            SDAE: "Solvencia DAE"}
  end
  
  def generate_workflow(procedure)
      workflow = Workflow.new()
      workflow.name = "Workflow Año Sabatico"
      workflow.description = "Flujo principal del trámite Año Sabatico"
      workflow.is_active = true
      workflow.procedure = procedure
      if workflow.save
        generate_steps(workflow)
      else
        # Render son error notification
      end 
  end

  def generate_steps(workflow)
    create_step(workflow, "#1", "Carga y evaluación de recaudos.","Direción de asuntos profesorales")
    create_step(workflow, "#2", "Cargar plan de trabajo.","Consejo de departamento")
    create_step(workflow, "#3", "Cargar constacia de antiguedad.","Consejo de departamento")
    create_step(workflow, "#4", "Generar constacia de aprobacion.","Consejo de departamento")
  end

  def create_step(workflow, name, description, group_name)
    step = Step.new(name: name, description: description, is_active: true)
    step.group = Group.find_by(name: group_name)
    step.workflow = workflow
    step.save
  end

  def initial_requirements_valid?() 

    if all_required_documents_has_attachment? and request_day_allowed?
      update_procedure_elements()
      send_email(self.procedure.user, 'initial_validation_success')
      users = User.find_group_members('D20')
      send_emails(users,'need_to_approve')
      return true
    else
      return false 
    end
  end

  def all_required_documents_has_attachment?
    return true #TODO CHANGE TO FALSE THIS IS JUST FOR TESTING
    @procedure.documents.each do |doc|
      if !doc.attachment.present? and @required_documents.has_value?(doc.name)
        return false
      end 
    end
  end

  def request_day_allowed?
    #Primeros 3 meses del año: 
    @procedure.created_at.between?(Date.new(Date.today.year,01,01) , Date.new(Date.today.year,03,31)) 
    return true #TODO CHANGE TO FALSE THIS IS JUST FOR TESTING
  end

  def update_procedure_elements()
    self.procedure.start! 
    start_step('#1')
  end

  def start_step(step_name)
    step = self.procedure.workflows.first.steps.where(name: step_name).first
    step.start!
    step.update(approved_at: Time.now)
  end 
  
end