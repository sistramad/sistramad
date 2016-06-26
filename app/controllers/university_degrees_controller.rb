class UniversityDegreesController < ApplicationController
  before_action :set_university_degree, only: [:show, :edit, :update, :destroy]

  # GET /university_degrees
  # GET /university_degrees.json
  def index
    @university_degrees = UniversityDegree.all
  end

  # GET /university_degrees/1
  # GET /university_degrees/1.json
  def show
  end

  # GET /university_degrees/new
  def new
    @university_degree = UniversityDegree.new
  end

  # GET /university_degrees/1/edit
  def edit
  end

  # POST /university_degrees
  # POST /university_degrees.json
  def create
    @university_degree = UniversityDegree.new(university_degree_params)

    respond_to do |format|
      if @university_degree.save
        format.html { redirect_to @university_degree, notice: 'University degree was successfully created.' }
        format.json { render :show, status: :created, location: @university_degree }
      else
        format.html { render :new }
        format.json { render json: @university_degree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /university_degrees/1
  # PATCH/PUT /university_degrees/1.json
  def update
    respond_to do |format|
      if @university_degree.update(university_degree_params)
        format.html { redirect_to @university_degree, notice: 'University degree was successfully updated.' }
        format.json { render :show, status: :ok, location: @university_degree }
      else
        format.html { render :edit }
        format.json { render json: @university_degree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /university_degrees/1
  # DELETE /university_degrees/1.json
  def destroy
    @university_degree.destroy
    respond_to do |format|
      format.html { redirect_to university_degrees_url, notice: 'University degree was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university_degree
      @university_degree = UniversityDegree.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def university_degree_params
      params.require(:university_degree).permit(:name, :university_id, :academic_degree_id)
    end
end
