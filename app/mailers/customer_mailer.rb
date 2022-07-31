class CustomerMailer < ApplicationMailer

  def remind_mail(customer)
    @customer = customer
    mail to: @customer.email, subject: '[自動送信]支払い期限が迫っています'
  end

end
