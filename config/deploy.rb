set :application, "hopshelf"
set :repository,  "ssh://git@173.230.146.14/home/git/shelfwire"
set :scm, :git

set :keep_releases, 5

require 'capistrano/ext/multistage'
set :stages, %w(staging production)
set :default_stage, "staging"

role :web, "173.230.146.14"                          # Your HTTP server, Apache/etc
role :app, "173.230.146.14"                          # This may be the same as your `Web` server
role :db,  "173.230.146.14", :primary => true # This is where Rails migrations will run

require "bundler/capistrano"

set :user, "rose"
set :use_sudo, false

namespace :deploy do
 task :cold do       # Overriding the default deploy:cold
  update
  run "cd #{current_path}; rake assets:precompile --trace"
  load_schema       # My own step, replacing migrations.
  start
 end
 
 task :load_schema, :roles => :app do
  env = ENV['env'] || 'staging' 
  run "cd #{current_path}; rake db:schema:load RAILS_ENV=#{env}"
 end

 task :start do ; end
 task :stop do ; end
 
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   migrate
 end
end
