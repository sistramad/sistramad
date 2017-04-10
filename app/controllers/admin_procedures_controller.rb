class AdminProceduresController < ApplicationController
  before_action :set_procedure, only: [:show]

  def index
    @procedures = Procedure.where(state: 'in_progress').page(params[:page]).per(10)
  end

  def show
    
  end

  def show_step
    @step = Step.find(params[:step])
    @procedure = Procedure.find(params[:procedure])
  
    case @step.admin_view
      when 'documents_list'  then 
        render 'documents_list'
      when 'show_document' then 
        @document = @procedure.documents.where(name: "Plan de Trabajo")
        render 'show_document'
      when 'upload_document' then  
        render 'upload_document'
      when 'approve_procedure' then 
        render 'approve_procedure'
    end
  end

  def set_procedure
    @procedure = Procedure.find(params[:id])
  end

  
end
