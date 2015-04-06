class AppointmentsController < ApplicationController
  def index
    @appointments = @user.appointments
    @appointment = Appointment.new
  end
end
