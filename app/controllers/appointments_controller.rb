class AppointmentsController < ApplicationController
  def index
    @user = current_user
    if current_user
      @appointments = @user.appointments
    else
      redirect_to
    end
  end

  def new
    @user = current_user
    @appointment = Appointment.new
    @doctors = Doctor.all
  end

  def edit
    @user = current_user
    @appointment = Appointment.find(params[:id])
    @doctor = @appointment.doctor
    @doctors = Doctor.all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: "Appointment Created with #{@appointment.doctor.name}"
    else render :new
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to root_path, notice: "Appointment Updated with #{@appointment.doctor.name}"
    else render :index
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:day, :user_id, :doctor_id)
  end
end
