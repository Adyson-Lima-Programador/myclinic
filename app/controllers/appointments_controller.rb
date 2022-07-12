class AppointmentsController < ApplicationController

  before_action :set_appointment, only: %i[show edit update destroy]

  def index

    if(params[:cpf].to_s != "")

      customer_find = Customer.where(cpf: params[:cpf])
      @appointments = Appointment.where(customer_id: customer_find).page(params[:page]).per(5)
      
    else
      
      @appointments = Appointment.order(:id).page(params[:page]).per(10)
    
    end

    if !params[:cpf]

      @appointments = Appointment.order(:id).page(params[:page]).per(10)
    
    end 
    
    @total_appointments = Appointment.all
    @appointments_returns = Appointment.where("category == '2'")


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

  def update

    respond_to do |format|

      if @appointment.update(appointment_params)
        format.html { redirect_to appointment_url(@appointment), notice: "Consulta atualizada."}      
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
      
    end

  end

  def destroy

    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Consulta apagada com sucesso.' }
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