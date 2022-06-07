require "rails_helper"

RSpec.describe Customer, type: :model do

  before {@customer = Customer.new}

  describe "Testa correto preenchimento dos campos do model Customer" do

    it "name consegue ser preenchido" do

      @customer.name = "José Silva"
      expect(@customer.name).to eq("José Silva")

    end

    it "email consegue ser preenchido" do

      @customer.email = "jose@gmail.com"
      expect(@customer.email).to eq("jose@gmail.com")

    end

    it "cell_phone consegue ser preenchido" do

      @customer.cell_phone = "5591923568945"
      expect(@customer.cell_phone).to eq("5591923568945")

    end

    it "cpf consegue ser preenchido" do

      @customer.cpf = "65236985478"
      expect(@customer.cpf).to eq("65236985478")

    end

    it "age consegue ser preenchido" do

      @customer.age = "65"
      expect(@customer.age).to eq("65")

    end

  end

end