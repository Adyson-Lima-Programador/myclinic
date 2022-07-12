require 'faker'

  puts "Gerando customers...\n\n"
  30.times do |i|
    
    Customer.create!(name: Faker::Name.name.downcase, email: Faker::Internet.email,
      cell_phone: Faker::Number.number(digits: 13), cpf: DocumentosBr.cpf, age: rand(0..120) )         

  end
  puts "Customers gerados com sucesso!\n\n"

  puts "Gerando professionals...\n\n"
  30.times do |i|
    # código especialidades 1 = clinico, 2 = cardiologista, 3 = otorrino
    Professional.create!(name: Faker::Name.name.downcase, email: Faker::Internet.email,
      cell_phone: Faker::Number.number(digits: 13), cpf: DocumentosBr.cpf, specialty: ["1","2","3"].sample )         

  end
  puts "Professionals gerados com sucesso!\n\n"