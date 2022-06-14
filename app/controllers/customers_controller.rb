class CustomersController < ApplicationController

  before_action :set_customer, only: %i[show edit update destroy]

  def index

    if(params[:cpf].to_s != "")

      customer_find = Customer.where(cpf: params[:cpf])
      @customers = Customer.where(id: customer_find).page(params[:page]).per(5)
      
    else
      
      @customers = Customer.order(:id).page(params[:page]).per(10)
    
    end

    if !params[:cpf]

      @customers = Customer.order(:id).page(params[:page]).per(10)
    
    end  

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

  

private

  def set_customer

    @customer = Customer.find(params[:id])

  end

  def customer_params

    params.require(:customer).permit(:name, :email, :cell_phone, :cpf, :age)

  end

end