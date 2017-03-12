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

  def requirements_valid?(procedure)   
    @procedure = procedure 
    request_day_allowed?
    all_required_documents_has_attachment? and request_day_allowed?
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