module FormHelper
  def setup_procedure(procedure)   
    3.times { procedure.documents.build }
    procedure
  end
end
