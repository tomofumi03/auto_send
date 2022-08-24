class CustomerMailer < ApplicationMailer

  def remind_mail(customer)
    @customer = customer
    mail to: @customer.email, subject: @customer.subject
  end

end
