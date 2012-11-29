Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://redistogo:b09d18cfcb8e65689cdb9231b410755a@tench.redistogo.com:9180/', :namespace => 'mynamespace' }
end

# When in Unicorn, this block needs to go in unicorn's `after_fork` callback:
Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://redistogo:b09d18cfcb8e65689cdb9231b410755a@tench.redistogo.com:9180/', :namespace => 'mynamespace' }
end
