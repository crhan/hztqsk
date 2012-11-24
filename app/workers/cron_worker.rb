class CronWorker
  include Sidekiq::Worker

  def perform
    puts "fetch data"
  end
end
