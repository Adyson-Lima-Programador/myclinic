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

  def new

    @appointment = Appointment.new

  end

  def edit

  end

  def create

    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html {redirect_to appointment_url(@appointment), notice: "Consulta criada."}
      else
        format.html {render :new, status: :unprocessable_entity}
      end
    end

  end


private

  def set_appointment

    @appointment = Appointment.find(params[:id])

  end

  def appointment_params

    params.require(:appointment).permit(:date, :hour, :customer_id, :professional_id, :category)

  end  

end