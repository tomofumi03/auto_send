class CustomerMailer < ApplicationMailer

  def remind_mail(customer)
    @customer = customer
    if @customer.subject == nil
      mail to: @customer.email, subject: "お知らせ"
    else
      mail to: @customer.email, subject: @customer.subject
    end
  end

end
