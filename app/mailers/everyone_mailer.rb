class EveryoneMailer < ApplicationMailer


  def remind_mail_to_everyone(customers)
    customers.each do |customer|
      mail bcc: customer[0], subject: customer[1]
    end
  end

end
