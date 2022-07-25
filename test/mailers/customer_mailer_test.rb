require 'test_helper'

class CustomerMailerTest < ActionMailer::TestCase
  def remind_mail #メソッドに対して引数を設定
    @user = User.second
    @customer = Customer.find_by(user_id: @user.id)#ユーザー情報
    #mail to: @customer.email, subject: '[自動送信]支払い期限が迫っています'
  end
end
