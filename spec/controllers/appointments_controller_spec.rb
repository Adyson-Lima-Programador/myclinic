require "rails_helper"

RSpec.describe AppointmentsController, type: :controller do

  describe "Testa actions do controller Appointments" do

    it "INDEX retorna status 200" do

      get :index
      expect(response).to have_http_status(200)

    end

  end

end