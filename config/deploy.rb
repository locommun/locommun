# Load RVM's capistrano plugin.
require "rvm/capistrano"

set :rvm_path, "/usr/local/rvm/"
set :rvm_type, :system  # Don't use system-wide RVM
set :use_sudo, false

set :user, "deploy"
set :domain, "h2164486.stratoserver.net"
set :application, "localmove.de"
set :repository,  "git://github.com/locommun/locommun.git"
set :deploy_to, "/var/www/vhosts/localmove.de/rails"

set :scm, :git
# Or: 'accurev', 'bzr', 'cvs', 'darcs', 'git', 'mercurial', 'perforce', 'subversion' or 'none'

role :web, domain                           # Your HTTP server, Apache/etc
role :app, domain                           # This may be the same as your 'Web' server
role :db,  domain, :primary => true         # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:update_code", :bundle_install
desc "Running the bundle install"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end