json.extract! formalities_master, :id, :name, :description, :table_manager, :isactive, :created_at, :updated_at
json.url formalities_master_url(formalities_master, format: :json)