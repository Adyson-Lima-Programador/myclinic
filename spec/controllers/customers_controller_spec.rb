require "rails_helper"

RSpec.describe CustomersController, type: :controller do

  describe "Testa actions do controller Customers" do

    it "INDEX retorna status 200" do

      get :index
      expect(response).to have_http_status(200)
      
    end

    it "SHOW retorna status 200" do

      customer = Customer.create(name:"José Silva",email:"jose@gmail.com",
        cell_phone:"5591923568945", cpf:"65236985478", age:"65")

      get :show, params: {id: customer.id}
      
    end

  end

end