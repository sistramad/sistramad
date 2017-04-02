class AdminProceduresController < ApplicationController

  def index
    @procedures = Procedure.all.page(params[:page]).per(3)
  end
  
end
