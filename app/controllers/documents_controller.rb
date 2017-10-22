class DocumentsController < ApplicationController
  include FactoryHelper
  before_action :set_document, only: [:edit, :update, :destroy, :show]

 def index
    @documents = Document.all
  end

  def new
    @document = Document.new
    if params.key?(:name) and params.key?(:code) and params.key?(:procedure) and params.key?(:step)
      @document.name = params[:name]
      @document.code = params[:code]
      @procedure = params[:procedure]
      @step_name = params[:step]
    end
  end

  def create
    @document = Document.new(document_params)
    @procedure = Procedure.find(params[:procedure])
    unless @procedure.nil?
      @document.procedure = @procedure
      @document.user = current_user
    end

    if @document.save
      update_step()
      if current_user.has_role? :admin
        redirect_to admin_procedure_path(@procedure), notice: "El documento #{@document.name} ha sido cargado con exito."
      else
        redirect_to procedure_path(@procedure), notice: "El documento #{@document.name} ha sido cargado con exito."
      end
    else
      render "new"
    end
  end

  def edit
    
  end

  def show
    @procedure = Procedure.find(params[:procedure])
  end

  def update
    procedure = Procedure.find(@document.procedure_id)
    if @document.update(document_params)
      redirect_to_specefic_show_route(procedure.code, @document)
    else
      render "new"
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_path, notice:  "The Document #{@document.name} has been deleted."
  end

private
  def document_params
    params.fetch(:document, {}).permit(:name, :attachment, :code)
  end

  def set_document
    @document = Document.find(params[:id])
  end

  def update_step()
    step_name = params[:step]
    unless @procedure.nil? or step_name.nil?
      concrete_procedure = get_procedure_intance(@procedure)
      concrete_procedure.start_step(step_name)
    end
  end

  def get_procedure_intance(procedure_obj)
    procedure_instance = get_procedure_from_factory(procedure_obj.code)
    procedure_instance.procedure = procedure_obj
    return procedure_instance
  end

  def redirect_to_specefic_show_route(code, document)
    case code
      when 'T-AS100' , 'T-AS101' , 'T-AS102' , 'T-AS103' , 'T-AS104' , 'T-AS105' then 
        redirect_to procedure_path(@document.procedure_id), notice: "El documento ha sido actualizado."       
      when 'T-SPF200' then redirect_to special_formation_procedure_plan_path(@document.procedure_id), notice: "El documento ha sido actualizado."
      when 'T-SPR201' then  redirect_to rotation_plan_path(@document.procedure_id), notice: "El documento ha sido actualizado."
      when 'T-MPR202' then  redirect_to modify_rotation_plan_path(@document.procedure_id), notice: "El documento ha sido actualizado."
      when 'T-PPR203' then  redirect_to delay_rotation_plan_path(@document.procedure_id), notice: "El documento ha sido actualizado."
      when 'T-SLR204' then  redirect_to license_path(@document.procedure_id), notice: "El documento ha sido actualizado."
      when 'T-SPL205' then  redirect_to delay_license_path(@document.procedure_id), notice: "El documento ha sido actualizado."
      when 'T-SRL206' then  redirect_to license_reincorporation_path(@document.procedure_id), notice: "El documento ha sido actualizado."
    end
  end

end
