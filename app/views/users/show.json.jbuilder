json.user do
  json.extract! @user, :id, :username, :first_name, :middle_name, :last_name, :genre, :identification_document,
                :birthday, :email, :created_at, :updated_at
end
