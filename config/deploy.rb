require 'bundler/capistrano'
require 'alchemy/capistrano'

# application name
set :application,               "alchemy-spree-demo"

# ssh settings
set :user,                      "rails4"

# domain names
role :app,                      "alchemy-cms.com"
role :web,                      "alchemy-cms.com"
role :db,                       "alchemy-cms.com", :primary => true

# the webserver path
set :deploy_to,                 "/var/www/#{application}"
set :deploy_via,                :remote_cache

# repository settings
set :scm,                       "git"
set :repository,                "git://github.com/magiclabs/#{application}.git"
set :branch,                    "master"

# rails env
set :rails_env,                 "production"

# before hooks
before 'deploy',                'deploy:web:disable'
before "deploy:start",          "deploy:seed"
before "deploy:create_symlink", "demo:reset"
before "deploy:create_symlink", "deploy:migrate"

# after hooks
after "deploy:setup",           "alchemy:database_yml:create"
after "deploy:finalize_update", "alchemy:database_yml:symlink"
after "deploy:finalize_update", "secret_token:symlink"
after "deploy:create_symlink",  "spree:images:symlink"
after "deploy",                 "deploy:web:enable"
after "deploy",                 "deploy:cleanup"

# special tasks

namespace :spree do
  namespace :images do
    desc "Creates the symlink for spree product images"
    task :symlink do
      run "rm -rf #{current_path}/public/spree"
      run "ln -nfs #{shared_path}/spree #{current_path}/public/"
    end
  end
end

namespace :demo do

  desc 'Resets the database to default demo content'
  task :reset do
    run "cd #{release_path} && RAILS_ENV=#{rails_env} #{rake} demo:reset"
  end

end

namespace :secret_token do

  desc 'Symlink the secret token from shared folder into app.'
  task :symlink do
    run "rm #{release_path}/config/initializers/secret_token.rb"
    run "ln -s #{shared_path}/config/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
  end

end

namespace :log do

  desc "show last 100 lines of log"
  task :show do
    run "tail -n100 #{shared_path}/log/#{rails_env}.log"
  end

  desc "watch tail of log and wait for additional data to be appended to the input"
  task :watch do
    stream("tail -f #{shared_path}/log/#{rails_env}.log")
  end

end

namespace :deploy do

  task :start do ; end
  task :stop do ; end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc 'Seeds the database'
  task :seed, :roles => :app, :except => { :no_release => true } do
    run "cd #{release_path} && #{rake} RAILS_ENV=#{rails_env} db:seed"
  end

end

## defaults

# enable bundler binstubs
set :bundle_flags,              "--deployment --binstubs"

# do not use sudo
set :use_sudo,                  false

# enable ssh-agent forwarding
ssh_options[:forward_agent] =   true

# Enable git password prompting
default_run_options[:pty]   =   true
