class ProfessionalsController < ApplicationController

  before_action :set_professional, only: %i[show edit update destroy]

  def index

    if(params[:cpf].to_s != "")

      professional_find = Professional.where(cpf: params[:cpf])
      @professionals = Professional.where(id: professional_find).page(params[:page]).per(5)
      
    else
      
      @professionals = Professional.order(:id).page(params[:page]).per(10)
    
    end

    if !params[:cpf]

      @professionals = Professional.order(:id).page(params[:page]).per(10)
    
    end
    
    @total_professionals = Professional.all
    @professionals_clinicos = Professional.where("specialty == '1'")

  end

  def show
  end

  def new

    @professional = Professional.new

  end

  def edit
  end

  def create

    @professional = Professional.new(professional_params)

    respond_to do |format|
      if @professional.save
        format.html { redirect_to professional_url(@professional), notice: "Profissional criado." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  
  end

  def update

    respond_to do |format|
      if @professional.update(professional_params)
        format.html { redirect_to professional_url(@professional), notice: "Profissional atualizado."}
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
    end
    
  end

  def destroy

    @professional.destroy
    respond_to do |format|
      format.html { redirect_to professionals_url, notice: 'Profissional apagado com sucesso.' }
    end

  end


private

  def set_professional

    @professional = Professional.find(params[:id])

  end

  def professional_params

    params.require(:professional).permit(:name, :email, :cell_phone, :cpf, :specialty)

  end
  
end