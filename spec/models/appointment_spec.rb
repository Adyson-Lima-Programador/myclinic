require "rails_helper"

RSpec.describe Appointment, type: :model do

  before{ 
    @appointment = Appointment.new
    
    @customer = Customer.create(name:"José Silva",email:"jose@gmail.com",
    cell_phone:"5591923568945", cpf:"65236985478", age:"65")
    
    @professional = Professional.create(name:"Pedro Silva",email:"pedro@gmail.com",
    cell_phone:"5591923188945", cpf:"65776985478",specialty:"cardiologista")  
  }

  describe "Testa correto preenchimento dos campos do model Appointment" do

    it "date consegue ser preenchido" do

      @appointment.date = "12051978"
      expect(@appointment.date).to eq("12051978")

    end

    it "hour consegue ser preenchido" do

      @appointment.hour = "12"
      expect(@appointment.hour).to eq("12")

    end

    it "customer consegue ser preenchido" do

      @appointment.customer_id = Customer.last.id
      expect(@appointment.customer_id).to eq("1")

    end

    it "professional consegue ser preenchido" do

      @appointment.professional_id = Professional.last.id
      expect(@appointment.professional_id).to eq("1")

    end

    it "type consegue ser preenchido" do

      @appointment.type = "return"
      expect(@appointment.type).to eq("return")

    end

  end

  describe "Testa validade do model Appointment" do

    it "Appointment válido com campos obrigatórios preenchidos" do

      @appointment.date = "12051978"
      @appointment.hour = "12"
      @appointment.customer_id = Customer.last.id
      @appointment.professional_id = Professional.last.id
      @appointment.type = "return"

      expect(@appointment).to be_valid

    end

    it "Appointment inválido com campos obrigatórios não preenchidos" do

      appointment = Appointment.new
      appointment.date = ""

      expect(appointment).to be_invalid

    end

  end


end