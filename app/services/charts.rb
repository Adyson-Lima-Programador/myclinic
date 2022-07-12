require 'gruff'

class Charts

  attr_reader :consultas, :retornos, :clientes, :clientes18

  def initialize(consultas, retornos, clientes, clientes18)
    @consultas = consultas
    @retornos = retornos

    @clientes = clientes
    @clientes18 = clientes18
  end

  def gerar_grafico_consultas
    g = Gruff::Pie.new
    g.title = 'Gráfico consultas/retornos'
    g.theme = Gruff::Themes::PASTEL
    
    g.data(:Consultas, [@consultas])
    g.data(:Retornos, [@retornos])

    g.write("#{Rails.root}/app/assets/images/charts/consultas.png")
        
  end

  def gerar_grafico_clientes
    g = Gruff::Pie.new
    g.title = 'Clientes adultos/menores'
    g.theme = Gruff::Themes::PASTEL
    
    g.data(:Menores, [@clientes])
    g.data(:Adultos, [@clientes18])

    g.write("#{Rails.root}/app/assets/images/charts/clientes.png")
        
  end

end