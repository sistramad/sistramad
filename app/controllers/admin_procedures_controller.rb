class AdminProceduresController < ApplicationController
  before_action :set_procedure, only: [:show]

  def index
    @procedures = Procedure.where(state: 'in_progress').page(params[:page]).per(10)
  end

  def show
    
  end

  def show_initial_requirements
    @procedure = Procedure.find(params[:procedure])
  end

  def approve_initial_requirements
    procedure = params[:id]
    @procedure = Procedure.find(procedure)
    step = @procedure.steps.find_by(name: params[:step])
    if step.in_progress?
      step.approve!
      flash[:success] = 'Los documentos han sido aprobados con exito.'
      render 'show'
    else
      flash[:error] = 'Imposible realizar ésta acción, los documentos ya fueron aprobados.'
      render 'show_initial_requirements'
    end
  end

  def show_document
    @procedure = Procedure.find(params[:id])
    @document = @procedure.documents.find_by(code: params[:document_code])
    @step = @procedure.steps.find_by(name: params[:step])
  end

  def approve_document
    @document = Document.find(params[:id])
    @procedure = Procedure.find(procedure)
    puts @procedure.name
    puts @document.name
  end

  def approve_step
    @procedure = Procedure.find(params[:id])
    step = Step.find(params[:step])
    if step.in_progress?
      step.approve!
      flash[:success] = 'Paso aprobado con exito!.'
    else
      flash[:error] = 'Imposible realizar ésta acción.'
    end
    redirect_to  admin_procedure_path(@procedure)
  end

  private

    def set_procedure
      @procedure = Procedure.find(params[:id])
    end
  
end
