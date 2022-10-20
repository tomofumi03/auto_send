#名前空間
namespace :mail_every_month do
  # タスクの説明
  desc "customersに一ヶ月に１回メールを配信する"
  # タスクの名前
  task remind_mail: :environment do
    customers = Customer.all
    customers.each do |customer|
      CustomerMailer.remind_mail(customer).deliver
    end
  end
end
