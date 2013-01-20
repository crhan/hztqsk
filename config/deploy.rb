# -*- encoding : utf-8 -*-
require 'bundler/capistrano'
require 'sidekiq/capistrano'

set :application, "hztqsk"
set :repository, "https://github.com/crhan/hztqsk.git"
set :scm, :git
set :deploy_to, "/home/crhan/app/hztqsk"

server "home.crhan.com", :app, :web, :db, :primary => true
set :user, "crhan"
set :use_sudo, false

require 'capistrano-unicorn'

namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} assets:precompile}
    end
  end
end
after "bundle:install", "deploy:assets:precompile"
