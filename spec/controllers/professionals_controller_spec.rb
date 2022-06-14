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

  end

end