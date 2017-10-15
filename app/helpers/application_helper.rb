module ApplicationHelper
  
  def state_translate(state)
    STATE_MAP[state]
  end

  def find_document_by_code(procedure, code)
    procedure.documents.find_by(code: code)
  end


end
