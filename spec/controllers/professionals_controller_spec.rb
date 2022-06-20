require "rails_helper"

RSpec.describe ProfessionalsController, type: :controller do

  describe "Testa actions do controller Professionals" do

    it "INDEX retorna status 200" do

      get :index
      expect(response).to have_http_status(200)

    end

    it "SHOW retorna status 200" do

      professional = Professional.create(id:1,name:"Pedro Silva",email:"pedro@gmail.com",
        cell_phone:"5591923188945", cpf:"65776985478",specialty:"cardiologista")

      get :show, params: {id: professional.id}
      expect(response).to have_http_status(200)

    end

    it "NEW retorna status 200" do

      get :new  
      expect(response).to have_http_status(200)

    end

    it "EDIT retorna status 200" do

      professional = Professional.create(id:1,name:"Carlos Silva",email:"pedro@gmail.com",
        cell_phone:"5591923188945", cpf:"65776985478",specialty:"cardiologista")
      patch :edit, params: {id: professional.id}
      expect(response).to have_http_status(200)

    end

    it "CREATE retorna status 302" do

      post :create, params:{professional:{name:"João Silva",email:"joao@gmail.com",
      cell_phone:"5591245568945", cpf:"65736985478", specialty:"cardiologist"}}
      expect(response).to have_http_status(302)
      
    end

    it "UPDATE retorna status 302" do

      professional = Professional.create(name:"Pedro Silva",email:"pedro@gmail.com",
        cell_phone:"5591923188945", cpf:"65776985478",specialty:"cardiologist")
      
      patch :update, params: {professional:{name:"Luis Silva",email:"luis@gmail.com",
      cell_phone:"5591923658945", cpf:"77776985478",specialty:"cardiologist"}, id: 1}
      expect(response).to have_http_status(302)
      
    end

    it "DESTROY retorna status 204" do

      professional = Professional.create(name:"Pedro Silva",email:"pedro@gmail.com",
        cell_phone:"5591923188945", cpf:"65776985478",specialty:"cardiologist")
      professional = Professional.last

      delete :destroy, params: {id: professional.id}
      expect(response).to have_http_status(204)

    end

  end

end