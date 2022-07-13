require 'rails_helper'

RSpec.describe "Manuals", type: :request do
  describe "GET /manual_myclinic" do
    it "returns http success" do
      get "/manual/manual_myclinic"
      expect(response).to have_http_status(:success)
    end
  end

end
