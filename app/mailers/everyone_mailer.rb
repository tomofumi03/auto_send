class EveryoneMailer < ApplicationMailer


  def remind_mail_to_everyone(customers)
      mail bcc: customers, subject: '[自動送信]支払い期限が迫っています'
  end

end
