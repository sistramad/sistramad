json.extract! formalities_document, :id, :formalities_master_id, :document_id, :created_at, :updated_at
json.url formalities_document_url(formalities_document, format: :json)