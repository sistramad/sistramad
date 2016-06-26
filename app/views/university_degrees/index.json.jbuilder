json.array!(@university_degrees) do |university_degree|
  json.extract! university_degree, :id, :name, :university_id, :academic_degree_id
  json.url university_degree_url(university_degree, format: :json)
end
