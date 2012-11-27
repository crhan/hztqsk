require 'clockwork'
require 'sidekiq'
require './app/workers/cron_worker'
include Clockwork

every 5.minutes, "CronWoker run" do
  CronWorker.perform_async
end
