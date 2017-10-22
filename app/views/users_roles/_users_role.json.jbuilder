json.extract! users_role, :id, :user_id, :role_id, :created_at, :updated_at
json.url users_role_url(users_role, format: :json)