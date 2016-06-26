json.array!(@references) do |reference|
  json.extract! reference, :id, :name, :description
  json.url reference_url(reference, format: :json)
end
