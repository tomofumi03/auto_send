class EveryoneMailer < ApplicationMailer


  def remind_mail_to_everyone(customers)
    customers.each do |customer|
      if customer[1] == nil
        mail bcc: customer[0], subject: "お知らせ"
      else
        mail bcc: customer[0], subject: customer[1]
      end
    end
  end
end
