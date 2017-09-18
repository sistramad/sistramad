class UniversityTransfer < Workflow
  include EmailService
    def initialize     
      self.name = "Traslado entre Universidades"
    end
    
    def generate_workflow(professors_transfer)
      request_workflow = RequestWorkflow.new()
      request_workflow.name = "Workflow Traslado entre Universidades"
      request_workflow.description = "Flujo principal del trámite de Traslado entre Universidades"
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
      create_step(request_workflow, 1, "Analisis y Remisión de juicio a Consejo de Departamento.","Consejo_Universitario")
      create_step(request_workflow, 2, "Analisis y Remisión de juicio a Decano.","Consejo_Departamento")
      create_step(request_workflow, 3, "Analisis y Remisión de juicio de Asuntos Profesorales.","decano")
      create_step(request_workflow, 4, "Verificar Aval Academico y Presupuestario","asuntos")
      create_step(request_workflow, 5, "Analisis y Remisión de juicio a Consejo de Facultad","asuntos")
      create_step(request_workflow, 6, "Analisis Final de Traslado","Consejo_Facultad")
    end
  
    def initial_requirements_valid?()
      if self.professors_transfer.IP?
        #update_procedure_elements()
        send_email(self.professors_transfer.user, 'initial_validation_success')
        step = self.professors_transfer.request_workflow.workflow_step.find_by(step_number: 1)
        users = Role.find_by(id: step.role_id).users
        send_emails(users,'need_to_approve')
        return true
      else
        return false
      end
    end
  
    
    def update_procedure_elements()
      self.professors_transfer.procesar! 
      start_step('#1')
    end
  
    
  end