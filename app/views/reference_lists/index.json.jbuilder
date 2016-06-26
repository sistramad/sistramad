json.array!(@reference_lists) do |reference_list|
  json.extract! reference_list, :id, :name, :description, :value, :reference_id
  json.url reference_list_url(reference_list, format: :json)
end
