class ReviewsController < ApplicationController
  include EmailService
  
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_professors_transfer, only: [:new,:new_aval_and_budget_revision]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    docs = FormalitiesMaster.find_by(name: 'Traslados').documents
    u_id = @professors_transfer.user_id
    @attachments = User.find_by(id: u_id).attachments.where(:document_id => docs)
    @step = WorkflowStep.find(params[:workflow_step_id])
    steps = @professors_transfer.workflow_steps
    @preview = Review.all.where(:workflow_step_id => steps)
    @review = Review.new
  end

   # GET /reviews/new
   def new_aval_and_budget_revision
    docs = FormalitiesMaster.find_by(name: 'Traslados').documents
    u_id = @professors_transfer.user_id
    @step = WorkflowStep.find(params[:workflow_step_id])
    steps = @professors_transfer.workflow_steps
    @preview = Review.all.where(:workflow_step_id => steps)
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user = current_user 
    @step = WorkflowStep.find(params[:workflow_step_id])
    @review.workflow_step = @step
    @review.name = @step.name
    @review.approval = params[:approval]
    @professors_transfer = ProfessorsTransfer.find(params[:review][:id])
    professors_transfer_instance = get_professors_transfer_instance(@professors_transfer)
    professors_transfer_instance.approve_step?(@step.step_number)
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'La revision se completo con Exito' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:name, :comment, :files_reviewed, :approval, :workflow_step_id, :user_id)
    end

    def set_professors_transfer
      @professors_transfer = ProfessorsTransfer.find(params[:id])
    end

    def set_user
      @user = current_user
   end

   def get_professors_transfer_instance(professors_transfer)
      type = Reference.find(@professors_transfer.type_of_translate).name
      instance = get_request_from_factory(type)
      instance.professors_transfer = professors_transfer
      return instance
    end

    def get_request_from_factory(type)
        factory = WorkflowFactory.new
        factory.build(type)
    end
end
