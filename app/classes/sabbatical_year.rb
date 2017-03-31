class SabbaticalYear < SystemProcedure
  attr_accessor :name
  attr_accessor :code
  @procedure
  @required_documents

  def initialize     
    @name = "Año Sabatico"
    @code = "T-AS100"
    @required_documents = { CI: "Cédula de Identidad", RIF: "Año Sabatico", CAC: "Carta de Aceptación", 
                            UAS: "Ultimo ascenso", SCU: "Sintesis curricular", SBI: "Solvencia Biblioteca", 
                            SDAE: "Solvencia DAE"}
  end
  
  def generate_workflow(procedure)
      puts procedure.name
      workflow = Workflow.new()
      #workflow = Workflow.new(name = "Workflow Año Sabatico", description = "Flujo principal del trámite para año Sabatico", is_active = true)
      workflow.name = "Workflow Año Sabatico Test"
      workflow.description = "Flujo principal del trámite para año Sabatico"
      workflow.is_active = true
      workflow.procedure = procedure
      if workflow.save
        generate_steps(workflow)
      else
        # Render son error notification
      end 
  end

  def generate_steps(workflow)
    create_step(workflow, "#1", "Evaluación de recaudos.","Direción de asuntos profesorales")
    create_step(workflow, "#2", "Cargar plan de trabajo.","Consejo de departamento")
    create_step(workflow, "#3", "Generar constacia de aprobacion.","Consejo de departamento")
    create_step(workflow, "#4", "Completar solicitud","Consejo de departamento")
  end

  def create_step(workflow, name, description, group_name)
    step = Step.new(name: name, description: description, is_active: true)
    step.group = Group.find_by(name: group_name)
    step.workflow = workflow
    step.save
  end

  def requirements_valid?(procedure)   
    @procedure = procedure 
    all_required_documents_has_attachment? and request_day_allowed?
    true #TODO delete this line is just for testing
  end

  def all_required_documents_has_attachment?
    @procedure.documents.each do |doc|
      if !doc.attachment.present? and @required_documents.has_value?(doc.name)
        return false
      end 
    end
    true
  end

  def request_day_allowed?
    @procedure.created_at.between?(Date.new(Date.today.year,01,01) , Date.new(Date.today.year,03,31)) #Primeros 3 meses del año. 
  end
  
end