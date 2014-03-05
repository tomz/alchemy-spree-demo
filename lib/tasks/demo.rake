namespace :demo do

  desc "Resets the demo website to defaults."
  task :reset => :environment do
    mysql_config = Rails.configuration.database_configuration[Rails.env]
    username = mysql_config['username']
    password = mysql_config['password']
    database = mysql_config['database']

    # Set maintenance notice
    system `echo "<h1>We are doing maintenance. Please stay tuned</h1>" > /var/www/alchemy-spree-demo/shared/system/maintenance.html`

    # recreate database
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke

    # read backup into database
    system `mysql -u#{username} -p#{password} #{database} < /home/#{username}/demo-files/spree-demo-dump.sql`

    # delete all uploaded files
    system `rm -Rf /var/www/alchemy-spree-demo/shared/uploads/*`
    system `rm -rf /var/www/alchemy-spree-demo/shared/spree/*`

    # copy backup upload-files into working-directory
    system `cp -Rf /home/#{username}/demo-files/uploads/* /var/www/alchemy-spree-demo/shared/uploads/`
    system `cp -Rf /home/#{username}/demo-files/spree/* /var/www/alchemy-spree-demo/shared/spree/`

    # clear cache
    Rake::Task['tmp:cache:clear'].invoke
    system `rm -Rf /var/www/alchemy-spree-demo/current/public/pictures/*`

    # Restart the application
    system `rm /var/www/alchemy-spree-demo/shared/system/maintenance.html`
    system `touch /var/www/alchemy-spree-demo/current/tmp/restart.txt`
  end

end
