require "rails_helper"

RSpec.describe ProfessionalsController, type: :controller do

  describe "Testa actions do controller Professionals" do

    it "INDEX retorna status 200" do

      get :index
      expect(response).to have_http_status(200)
      
    end

  end

end