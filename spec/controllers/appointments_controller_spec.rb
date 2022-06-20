require "rails_helper"

RSpec.describe AppointmentsController, type: :controller do

  before {

    @customer = Customer.create(id:1,name:"José Silva",email:"jose@gmail.com",
        cell_phone:"5591923568945", cpf:"65236985478", age:"65")

    @professional = Professional.create(id:1,name:"Pedro Silva",email:"pedro@gmail.com",
      cell_phone:"5591923188945", cpf:"65776985478",specialty:"cardiologista")

  }

  describe "Testa actions do controller Appointments" do

    it "INDEX retorna status 200" do

      get :index
      expect(response).to have_http_status(200)

    end

    it "SHOW retorna status 200" do
      
      appointment = Appointment.create(id:1, date:"20062022", hour:"14", customer_id:@customer.id,
        professional_id:@professional.id, category:"first")  

      get :show, params: {id: appointment.id}
      expect(response).to have_http_status(200)

    end

    it "NEW retorna status 200" do

      get :new
      expect(response).to have_http_status(200)

    end

  end

end