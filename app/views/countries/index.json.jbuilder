json.array!(@countries) do |country|
  json.extract! country, :id, :name, :capital, :region_id, :sub_region_id, :latitude, :longitude, :nativeName, :alpha2Code, :alpha3Code
  json.url country_url(country, format: :json)
end
