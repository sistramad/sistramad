class ExtensionsController < ApplicationController

  before_action :authenticate_user!
  require 'rubygems'
  require 'zip'
  require 'tempfile'

  def new
    @joint_plan = JointPlan.new
    @documents = JointplanDocument.all
    @user =  @joint_plan.user
    @attachment = Attachment.new
    @extension = Extension.new
    @document = Document.new
    @plan_id = JointPlan.where(:user_id => current_user.id).pluck(:id)
  end
  def show

  end

  def create
    @extension = Extension.new(extension_params)

    respond_to do |format|
      if @extension.save


        format.html { redirect_to joint_plans_path, notice: 'Su documento se ha cargado satisfactoriamente' }
        format.json { render :show, status: :created, location: @extension}
      else
        format.html { render :new }
        format.json { render json: @extension.errors, status: :unprocessable_entity }
      end
    end
  end

  private


  def extension_params
    # It's mandatory to specify the nested attributes that should be whitelisted.
    # If you use `permit` with just the key that points to the nested attributes hash,
    # it will return an empty hash.
    params.require(:extension).permit(:user_id,:joint_plan_id,:approved,:new_date,:file)
  end


end