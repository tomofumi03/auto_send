# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:

env :PATH, ENV['PATH']
set :output, "log/cron.log"  #ログファイルの出力先を指定
set :environment, :development
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

every 1.month, at: 'last of the month at 7:00 am' do
  runner "EveryoneMailer.remind_mail_to_everyone"
end


# Learn more: http://github.com/javan/whenever
