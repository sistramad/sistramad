module FormHelper
  def setup_procedure(procedure) 
    procedure_documents = procedure_documents_look_up(procedure)

    procedure_documents.each do |document|
      procedure.documents.build(name: document.name)      
    end
    procedure
  end

  def procedure_documents_look_up(procedure)
    procedure_documents = DocumentMaster.where(procedure: "Año Sabatico", active: true)   
  end

end
