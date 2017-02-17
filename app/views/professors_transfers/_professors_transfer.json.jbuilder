json.extract! professors_transfer, :id, :name, :status, :user_id, :isactive, :processed, :isapproved, :created_at, :updated_at
json.url professors_transfer_url(professors_transfer, format: :json)