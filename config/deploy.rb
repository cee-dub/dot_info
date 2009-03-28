# Basic config options
set :application, "dot_info"
set :deploy_to,   "/home/cameron/public_html/#{application}"
set :domain,      "number1" # definded in /etc/hosts on local machine
set :use_sudo,    false

role :app, domain
role :web, domain
# role :db,  domain, :primary => true

# Dependencies
depend :remote, :gem, "taf2-curb", "0.2.8.0"
depend :remote, :gem, "chriseppstein-compass", "0.5.4"
depend :remote, :gem, "haml", "2.1.0"
depend :remote, :command, "git"

# Extensions
## e.g. # load 'config/deploy/analytics'

default_run_options[:pty] = true
# Deploy using an ssh agent.
ssh_options[:forward_agent] = true
ssh_options[:paranoid] = false
ssh_options[:port] = 20020

set :scm, :git

## Deploy using local copy
set :deploy_via, :copy
set :repository,  "/Users/cameron/clients/cee-dub/dotinfo"

## Deploy using Github
# set :github_user, "cee-dub"
# set :repository,  "git@github.com:#{github_user}/#{application}.git"

namespace(:deploy) do  
  desc "Long deploy will throw up the maintenance.html page and run migrations 
        then it restarts and enables the site again."
  task :long do
    transaction do
      update_code
      web.disable
      symlink
      migrate
    end
  
    restart
    web.enable
  end

  desc "Restart the application by notifying Passenger that the code has changed."
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  task :start, :roles => :app do
    # nothing
  end

  task :stop, :roles => :app do
    # nothing
  end
  
  # task :after_symlink, :roles => :app do
  #   # nothing
  # end
end