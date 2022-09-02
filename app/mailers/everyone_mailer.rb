class EveryoneMailer < ApplicationMailer


  def remind_mail_to_everyone(customer)
      if customer[1] == nil
        @customer = customer
        mail bcc: @customer[0], subject: "お知らせ"
      else
        @customer = customer
        mail bcc: @customer[0], subject: @customer[1]
      end
  end
end
