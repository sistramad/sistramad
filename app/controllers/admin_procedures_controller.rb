class AdminProceduresController < ApplicationController

  def index
    @procedures = Procedure.all.page(params[:page]).per(10)
  end
  
end
