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

    it "EDIT retorna status 200" do

      appointment = Appointment.create(id:1, date:"21062022", hour:"14", customer_id:@customer.id,
        professional_id:@professional.id, category:"return")
      patch :edit, params: {id: appointment.id}
      expect(response).to have_http_status(200)
    
    end

    it "CREATE retorna status 302" do

      post :create, params: {appointment:{date:"21062022", hour:"14", customer_id:@customer.id,
      professional_id:@professional.id, category:"return"}}
      expect(response).to have_http_status(302)

    end

    it "UPDATE retorna status 302" do

      appointment = Appointment.create(date:"20062022", hour:"14", customer_id:@customer.id,
        professional_id:@professional.id, category:"first")

      patch :update, params: {appointment:{date:"22062022", hour:"14", customer_id:@customer.id,
      professional_id:@professional.id, category:"return"}, id:1}
      expect(response).to have_http_status(302)

    end

  end

end