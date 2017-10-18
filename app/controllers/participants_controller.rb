class ParticipantsController < ApplicationController
  
  def destroy
    @procedure = Procedure.find(params[:procedure])
    @participants = @procedure.participants.where(user_id: params[:id]).first
    @participants.destroy
    respond_to do |format|
      format.html { redirect_to add_participants_rotation_plan_path(@procedure), notice: "Usuario eliminado"  }
    end
  end
  
end