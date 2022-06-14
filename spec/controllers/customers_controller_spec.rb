require "rails_helper"

RSpec.describe CustomersController, type: :controller do

  describe "Testa actions do controller Customers" do

    it "INDEX retorna status 200" do

      get :index
      expect(response).to have_http_status(200)
      
    end

    it "SHOW retorna status 200" do

      customer = Customer.create(id:1,name:"José Silva",email:"jose@gmail.com",
        cell_phone:"5591923568945", cpf:"65236985478", age:"65")

      get :show, params: {id: customer.id}
      expect(response).to have_http_status(200)

    end

    it "NEW retorna status 200" do

      get :new
      expect(response).to have_http_status(200)

    end

    it "EDIT retorna status 200" do

      customer = Customer.create(id:2,name:"Carlos Silva",email:"jose@gmail.com",
        cell_phone:"5591923568945", cpf:"65236985478", age:"65")

      patch :edit, params: {id: customer.id}
      # template edit.html.erb obrigatorio pra passar com status GREEN
      expect(response).to have_http_status(200)

    end

    it "CREATE retorna status 302" do

      post :create, params:{customer:{name:"José Silva",email:"jose@gmail.com",
      cell_phone:"5591923568945", cpf:"65236985478", age:"65"}}
      expect(response).to have_http_status(302)
    
    end

    it "UPDATE retorna status 302" do

      customer = Customer.create(name:"José Silva",email:"jose@gmail.com",
        cell_phone:"5591923568945", cpf:"65236985478", age:"65")

      patch :update, params: {customer:{name:"João da Silva",email:"jose@gmail.com",
      cell_phone:"5591923568945", cpf:"65236985478", age:"65"}, id: 1}

      expect(response).to have_http_status(302)

    end

    it "DELETE retorna status 204" do

      customer = Customer.create(name:"José Silva",email:"jose@gmail.com",
        cell_phone:"5591923568945", cpf:"65236985478", age:"65")
    
      customer = Customer.last
      delete :destroy, params: {id: customer.id}
      expect(response).to have_http_status(204)
    end

  end

end