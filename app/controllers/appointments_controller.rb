class AppointmentsController < ApplicationController
  def index
    @user = current_user
    @appointments = @user.appointments
    @appointment = Appointment.new
  end
end
