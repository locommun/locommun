class ContactMailer < ActionMailer::Base
  default from: "info@locommun.eu"
  
  def contact(e_mail, text)
    @email=e-mail
    @text =text
    mail(:to => "tobi@schmidies.de", :subject => "[Contact from]" + e_mail)
  end
  
end