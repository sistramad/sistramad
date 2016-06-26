json.array!(@universities) do |university|
  json.extract! university, :id, :name, :acronym, :country_id
  json.url university_url(university, format: :json)
end
