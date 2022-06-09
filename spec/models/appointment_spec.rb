require "rails_helper"

RSpec.describe Appointment, type: :model do

  before{ @appointment = Appointment.new }

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

      @appointment.customer_id = "120"
      expect(@appointment.customer_id).to eq("120")

    end

    it "professional consegue ser preenchido" do

      @appointment.professional_id = "5"
      expect(@appointment.professional_id).to eq("5")

    end

    it "type consegue ser preenchido" do

      @appointment.type = "return"
      expect(@appointment.type).to eq("return")

    end

  end


end