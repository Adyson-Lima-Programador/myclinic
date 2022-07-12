require 'charts'

class ReportController < ApplicationController
  def index

    @total_customers = Customer.all
    @customers_18 = Customer.where("age > '18'")

    @total_professionals = Professional.all
    @clinic_professionals = Professional.where("specialty == '1'")

    @total_appointments = Appointment.all
    @appointments_returns = Appointment.where("category == '2'")

    Charts.new(@total_appointments.size, @appointments_returns.size, 0, 0).gerar_grafico_consultas

    Charts.new(0, 0, @total_customers.size, @customers_18.size).gerar_grafico_clientes

  end
end
