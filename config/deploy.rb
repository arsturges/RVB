set :application, "dalm"
set :repository,  "git://github.com/arsturges/RVB.git"
set :keep_releases, 7
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "ead5.lbl.gov"                          # Your HTTP server, Apache/etc
role :app, "ead5.lbl.gov"                          # This may be the same as your `Web` server
role :db,  "ead5.lbl.gov", :primary => true # This is where Rails migrations will run
set :deploy_to,     "/data/www/html/#{application}"
set :use_sudo, false
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

namespace :deploy do

  task :restart do
    run "cd #{current_path}/tmp && touch restart.txt"
  end

  task :after_update_code do
    run <<-CMD
      ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml
    CMD
  end
end

after "deploy", "deploy:cleanup"
# can I delete the lines above? (25 adn 26?)  ln -nfs #{shared_path}/db/development.sqlite3  #{release_path}/db/development.sqlite3  &&
      # ln -nfs #{shared_path}/db/production.sqlite3  #{release_path}/db/production.sqlite3



# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start {}
#   task :stop {}
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end