json.users do
  json.array!(@users) do |user|
    json.extract! user, :id, :username, :first_name, :middle_name, :last_name, :genre, :identification_document, :birthday,
                  :email
    json.url user_url(user, format: :json)
  end
end
