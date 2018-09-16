class ContactMailer < ApplicationMailer
  def contact_mail(user)
    @user = user
    mail to: user.email, subject: 'つぶやき作成'
  end
  
  def new
    @blog = blog
  end
end