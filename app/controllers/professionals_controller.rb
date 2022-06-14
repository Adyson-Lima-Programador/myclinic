class ProfessionalsController < ApplicationController

  before_action :set_professional, only: %i[show edit update destroy]

  def index
    
  end

private

  def set_professional

    @professional = Professional.find(params[:id])

  end

  def professional_params

    params.require(:professional).permit(:name, :email, :cell_phone, :cpf, :specialty)

  end
  
end