class AppointmentsController < ApplicationController
  def index
    @user = current_user
    @appointments = @user.appointments
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to root_path
    else render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:day, :user_id, :doctor_id)
  end
end
