# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview
  def remind_mail #メソッドに対して引数を設定
    @user = User.second
    @customer = Customer.find_by(user_id: @user.id)#ユーザー情報
    #subject: '[自動送信]支払い期限が迫っています'
  end
end
