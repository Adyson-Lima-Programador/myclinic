require 'send_sms'

class CustomersController < ApplicationController

  before_action :set_customer, only: %i[show edit update destroy]

  def index

    if(params[:cpf].to_s != "")

      customer_find = Customer.where(cpf: params[:cpf])
      @customers = Customer.where(id: customer_find)
      
    else
      
      @customers = Customer.order(:id).page(params[:page]).per(10)
    
    end

    if !params[:cpf]

      @customers = Customer.order(:id).page(params[:page]).per(10)
    
    end
    
    @total_customers = Customer.all
    
    @customers_maiores_18 = Customer.where("age > '18'")

  end

  def show

  end

  def new

    @customer = Customer.new

  end

  def edit

  end

  def create

    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        # SendSms.new("Parabéns #{@customer.name}, você foi cadastrado no MyClinic!", @customer.cell_phone).call
        ContactMailer.contact_email(@customer).deliver_now
        format.html {redirect_to customer_url(@customer), notice: "Cliente criado."}
      else
        format.html {render :new, status: :unprocessable_entity}
      end
    end

  end

  def update

    respond_to do |format|

      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "Cliente atualizado."}      
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
      
    end

  end

  def destroy
  
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Cliente apagado com sucesso.' }
    end

  end

private

  def set_customer

    @customer = Customer.find(params[:id])

  end

  def customer_params

    params.require(:customer).permit(:name, :email, :cell_phone, :cpf, :age)

  end

end