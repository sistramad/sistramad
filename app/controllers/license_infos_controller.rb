class LicenseInfosController < ApplicationController
  before_action :set_license_info, only: [:edit, :update]
  before_action :set_procedure, only: [:edit, :update]

  def edit
    if params[:period].present?
      @form = "period_form"
    end
  end

  def update
    respond_to do |format|
      if @license_info.update(license_info_params)
        format.html { redirect_to license_path(@procedure), notice: 'Se actualizó la información.' }
      else
        format.html { redirect_to license_path(@procedure), notice: 'Ha ocurrido un error, no se puedo actualizar la informacioón.' }
      end
    end
  end
  
  private
  
    def license_info_params
      params.require(:license_info).permit(:procedure_id, :license_type_id, :license_period_id)
    end

    def set_license_info
      @license_info = LicenseInfo.find(params[:id])
    end

    def set_procedure
      @procedure = Procedure.find(@license_info.procedure.id)
    end

end
