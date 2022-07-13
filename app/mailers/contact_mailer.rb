class ContactMailer < ApplicationMailer

  def contact_email(customer)
    @customer = customer
    mail(to: "#{@customer.email}", subject: "#{@customer.name}, seu cadastro foi realizado com sucesso no MyClinic.")
  end
  
end
