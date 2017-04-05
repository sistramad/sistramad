class AdminProceduresController < ApplicationController

  def index
    @procedures = Procedure.all.page(params[:page]).per(10)
  end

  def show_step
    @step = Step.find(params[:step])

  end

  
end
