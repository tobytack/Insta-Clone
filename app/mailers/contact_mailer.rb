class ContactMailer < ApplicationMailer
  def contact_mail(user)
    @user = user
    mail to: user.email, subject: 'Picture作成'  
  end
end