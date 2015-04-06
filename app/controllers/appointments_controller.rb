class AppointmentsController < ApplicationController
  def index
    @user = current_user
    @appointments = @user.appointments
  end

  def new
    @user = current_user
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = Appointment.new
  end

  def edit
    @user = current_user
    @appointment = Appointment.find(params[:id])
    @doctor = @appointment.doctor
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to root_path
    else render :new
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(appointment_params)
      redirect_to root_path
    else render :index
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:day, :user_id, :doctor_id)
  end
end
