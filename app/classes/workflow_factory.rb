class WorkflowFactory
    def build(type)
      case type
        when 'Universidades'  then UniversityTransfer.new
        when 'Facultades'  then FacultyTransfer.new
        when 'Escuela o Departamento'  then DepartmentTransfer.new
        when 'Cambio de Dedicación Permanente'  then PermanentChange.new
        when 'Cambio de Dedicación Temporal'  then TemporalChange.new
        when 'Permanencia en la Decicación'  then DedicationStay.new
      end
    end 
  end