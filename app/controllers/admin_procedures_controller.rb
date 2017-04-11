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
      flash[:success] = 'Los documentos han sido aprovados con exito.'
      render 'show'
    else
      flash[:error] = 'Imposible realizar ésta acción, los documentos ya fueron aprobados.'
      render 'show_initial_requirements'
    end
  end

  private

    def set_procedure
      @procedure = Procedure.find(params[:id])
    end
  
end
