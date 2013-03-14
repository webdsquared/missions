require "bundler/capistrano"

server "198.211.108.85", :web, :app, :db, primary: true

set :application, "missions"
set :user, "deployer"
set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "https://github.com/webdsquared/#{application}.git"
set :branch, "master"

set :default_environment, {
	'PATH' => "/usr/local/.rvm/gems/ruby-1.9.3-p392/bin:/home/aaron/.rvm/gems/ruby-1.9.3-p392@global/bin:/home/aaron/.rvm/rubies/ruby-1.9.3-p392/bin:/home/aaron/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games",
	'RUBY_VERSION' => '1.9.3p392',
	'GEM_HOME' => '/usr/local/rvm/gems/ruby-1.9.3-p392',
	'GEM_PATH' => '/usr/local/rvm/gems/ruby-1.9.3-p392:/home/aaron/.rvm/gems/ruby-1.9.3-p392@global'
}

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" #keep only the last 5 releases


# set :application, "set your application name here"
# set :repository,  "set your repository location here"
# 
# # set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
# 
# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

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