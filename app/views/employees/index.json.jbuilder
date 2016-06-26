json.array!(@employees) do |employee|
  json.extract! employee, :id, :user_id, :type_employee_id, :scale_clasification_id, :scale_category_id
  json.url employee_url(employee, format: :json)
end
