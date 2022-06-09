require "rails_helper"

RSpec.describe Professional, type: :model do

  before {@professional = Professional.new}

  describe "Testa correto preenchimento dos campos do model Professional" do

    it "name consegue ser preenchido" do

      @professional.name = "José Silva"
      expect(@professional.name).to eq("José Silva")

    end

    it "email consegue ser preenchido" do

      @professional.email = "jose@gmail.com"
      expect(@professional.email).to eq("jose@gmail.com")

    end

    it "cell_phone consegue ser preenchido" do

      @professional.cell_phone = "5591923568945"
      expect(@professional.cell_phone).to eq("5591923568945")

    end

    it "cpf consegue ser preenchido" do

      @professional.cpf = "65236985478"
      expect(@professional.cpf).to eq("65236985478")

    end

    it "specialty consegue ser preenchido" do

      @professional.specialty = "cardiologista"
      expect(@professional.specialty).to eq("cardiologista")

    end

  end

  describe "Testa validade do model professional" do

    it "Professional válido com campos obrigatórios preenchidos" do

      @professional.name = "José Silva"
      @professional.email = "jose@gmail.com"
      @professional.cell_phone = "5591923568945"
      @professional.cpf = "65236985478"
      @professional.specialty = "cardiologista"

      expect(@professional).to be_valid

    end

    it "Professional inválido com campos obrigatórios não preenchidos" do

      professional = Professional.new
      professional.name = ""

      expect(professional).to be_invalid

    end


  end

end