class EveryoneMailer < ApplicationMailer


  def remind_mail_to_everyone(customers)
      mail bcc: customers[0], subject: [1]
  end

end
