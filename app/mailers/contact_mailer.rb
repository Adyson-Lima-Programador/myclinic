class ContactMailer < ApplicationMailer

  def contact_email(contact)
    @contact = contact
    mail(to: "#{@contact.email}", subject: "#{@contact.subject}.")
  end

  
end
