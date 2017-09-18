class WorkflowFactory
    def build(type)
      case type
        when 'Universidades'  then UniversityTransfer.new
        when 'Facultades'  then FacultyTransfer.new
        when 'Escuela o Departamento'  then DepartmentTransfer.new
      end
    end 
  end