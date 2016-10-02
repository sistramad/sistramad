class Country < ActiveRecord::Base
  belongs_to  :region, :class_name => 'ReferenceList'
  belongs_to  :sub_region, :class_name => 'ReferenceList'

  def self.insert_records
    url = "https://restcountries.eu/rest/v1/all"
    RestClient.get(url) { |response, request, result, &block|

      case response.code
        when 200
          obj = JSON.parse(response)

          obj.each_with_index do |i, index|
            country = new(:name => i['name'],
                          :capital => i['capital'],
                          :latitude => i['latlng'][0],
                          :longitude => i['latlng'][1],
                          :alpha2code => i['alpha2Code'],
                          :alpha3code => i['alpha3Code'],
                          :native_name => i['nativeName'])
            country.region_id = ReferenceList.find_by_name(i['region'].downcase) ?
                ReferenceList.find_by_name(i['region'].downcase).id : ReferenceConstant::WITHOUT_REGION

            country.sub_region_id = ReferenceList.find_by_name(i['subregion'].downcase) ?
                ReferenceList.find_by_name(i['subregion'].downcase).id : ReferenceConstant::WITHOUT_SUB_REGION

            country.latitude = 0 if country.latitude.nil?
            country.longitude = 0 if country.longitude.nil?

            country.save!

            ap "Country #{country.name} created." if (index % 50) == 0
          end
        else
          response.return!(request, result, &block)
      end
    }
  end

  def region_name
    self.region.name
  end

  def sub_region_name
    self.sub_region.name
  end
end
