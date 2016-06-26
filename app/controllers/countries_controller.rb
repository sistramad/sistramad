class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.all
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
  end

  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def insert_records
    respond_to do |format|
      url = "https://restcountries.eu/rest/v1/all"
      RestClient.get(url){ |response, request, result, &block|

        case response.code
          when 200
            #parsed_json =  ActiveSupport::JSON.decode(response)
            obj = JSON.parse(response)

            # array_regions = []
            # array_sub_regions = []
            # obj.each do |i|
            #   array_regions << i['region']
            #   array_sub_regions << i['subregion']
            # end
            # ap array_regions.uniq!
            # ap array_sub_regions.uniq!

          obj.each do |i|
            country = Country.new(:name => i['name'],
                                  :capital => i['capital'],
                                  :latitude => i['latlng'][0],
                                  :longitude => i['latlng'][1],
                                  :native_name => i['nativeName'],
                                  :alpha2code => i['alpha2Code'],
                                  :alpha3code => i['alpha3Code'])
            country.region_id = ReferenceList.find_by_name(i['region'].downcase) ? ReferenceList.find_by_name(i['region'].downcase).id : ReferenceConstant::WITHOUT_REGION
            country.sub_region_id = ReferenceList.find_by_name(i['subregion'].downcase) ? ReferenceList.find_by_name(i['subregion'].downcase).id : ReferenceConstant::WITHOUT_SUB_REGION

            country.save
            end
          else
            response.return!(request, result, &block)
        end }
      format.html { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name, :capital, :region_id, :sub_region_id, :latitude, :longitude, :nativeName, :alpha2Code, :alpha3Code)
    end
end
