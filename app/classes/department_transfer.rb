class DepartmentTransfer < Workflow
    include EmailService
  
    def initialize     
      self.name = "Traslado entre Departamentos y/o Escuelas"
    end

    def generate_workflow(professors_transfer)
        request_workflow = RequestWorkflow.new()
        request_workflow.name = "Workflow Traslado entre Departamentos y/o Escuelas"
        request_workflow.description = "Flujo principal del trámite de Traslado entre Departamentos y/o Escuelas"
        request_workflow.is_active = true
        request_workflow.professors_transfer = professors_transfer
        if request_workflow.save
          generate_steps(request_workflow)
        else
          # Render son error notification
        end 
    end

    #Definir ROLES INVOLUCRADOS para cada paso
    def generate_steps(request_workflow)
      #buscar los roles responsables en cda paso
      create_step(request_workflow, 1, "Analisis y Remisión de juicio a Decano.","Consejo_Departamento")
      create_step(request_workflow, 2, "Analisis y Remisión de juicio de Asuntos Profesorales.","decano")
      create_step(request_workflow, 3, "Verificar Aval Academico y Presupuestario","asuntos")
      create_step(request_workflow, 4, "Analisis y Remisión de juicio a Consejo de Facultad","asuntos")
      create_step(request_workflow, 5, "Analisis Final de Traslado","Consejo_Facultad")
    end

end    