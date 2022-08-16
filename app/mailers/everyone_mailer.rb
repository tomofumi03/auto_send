class EveryoneMailer < ApplicationMailer
  #default to: @customers

  def remind_mail_to_everyone(customer)
    @customer = customer
    mail bcc: @customer[0], subject: '[自動送信]支払い期限が迫っています'
  end

end
