class CustomerMailer < ApplicationMailer

  def remind_mail(customer) #メソッドに対して引数を設定
    @customer = customer#ユーザー情報
    mail to: @customer.email, subject: '[自動送信]支払い期限が迫っています'
  end

end
