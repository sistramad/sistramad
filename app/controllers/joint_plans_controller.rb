class JointPlansController < ApplicationController

  before_filter :authenticate_user!
  require 'rubygems'
  require 'zip'
  require 'tempfile'

  def new
    @joint_plan = JointPlan.new
    @documents = Document.all
    @user =  @joint_plan.user
    @attachment = Attachment.new
  end
  def show

  end

  def download

    @submissions = Attachment.where('user_id = ?',params[:user_id])

    file_origin = Rails.root.to_s+'/public'
    filename = 'recuados_'+User.find(params[:user_id]).username+'.zip'
    file = Tempfile.new(filename)

    begin
      Zip::OutputStream.open(file) { |zos| }

      #Añadiendo archivos al Zip
      Zip::File.open(file.path, Zip::File::CREATE) do |zipfile|
        @submissions.each do |filename|
          zipfile.add(filename.file_file_name, file_origin + filename.file.url(:original, false))
          end
      end

      zip_data = File.read(file.path)

      send_data(zip_data, :type => 'application/zip', :filename => filename)
    ensure
      #Close and delete the temp file
      file.close
      file.unlink
    end

  end

  def index
    @joint_plans = JointPlan.all
    @report = Report.new
    @joint_plan = JointPlan.new

=begin
    unless current_user.has_role? :decano
      flash[:notice] = "You don't have access to that order!"
    end
=end

  end

  def accept
      id = params[:id]


        JointPlan.find(id).update_attribute(:status, '5')
    redirect_to status_joint_plans_path, notice: 'Plan Aceptado Exitosamente'

  end

  def decline
    id = params[:id]

    JointPlan.find(id).update_attribute(:status, '6')
    redirect_to status_joint_plans_path, notice: 'Has declinado el plan'
  end

  def update


  end

  def inform
    @joint_plan = JointPlan.new
    @document = Document.find(16)
    @attachment = Attachment.new
    @plan_id = JointPlan.where(:user_id => current_user.id).pluck(:id)
  end

  def inform_list
    @joint_plans = Attachment.where('joint_plan_id > ?', 0)
    @prueba = JointPlan.joins(attachments: :document)
    @report = Report.new
    @joint_plan = JointPlan.new
  end

  private


  def plan_params
    # It's mandatory to specify the nested attributes that should be whitelisted.
    # If you use `permit` with just the key that points to the nested attributes hash,
    # it will return an empty hash.
    params.require(:joint_plan).permit(:name, :status, :answer ,user_attributes: [ :id, attachment_attributes:[:id, :file]])
  end


end