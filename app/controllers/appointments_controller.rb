class AppointmentsController < ApplicationController

  def index

    if(params[:date].to_s != "")

      appointment_find = Appointment.where(date: params[:date])
      @appointments = Appointment.where(id: appointment_find).page(params[:page]).per(5)
      
    else
      
      @appointments = Appointment.order(:id).page(params[:page]).per(10)
    
    end

    if !params[:date]

      @appointments = Appointment.order(:id).page(params[:page]).per(10)
    
    end  


  end

  def show
    
  end

private

  def set_appointment

    @appointment = Appointment.find(params[:id])

  end

  def appointment_params

    params.require(:appointment).permit(:date, :hour, :customer_id, :professional_id, :category)

  end  

end