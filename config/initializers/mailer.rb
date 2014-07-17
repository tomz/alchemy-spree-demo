if Rails.env.development?
  ActionMailer::Base.delivery_method = :letter_opener
elsif Rails.env.test?
  ActionMailer::Base.delivery_method = :test
else
  ActionMailer::Base.delivery_method = :smtp

  ActionMailer::Base.smtp_settings = {
     :address              => "email-smtp.us-east-1.amazonaws.com",
     :port                 => 25,
     :user_name            => ENV['MAILER_USERNAME'],
     :password             => ENV['MAILER_PASSWORD'],
     :domain               => 'intridea.com',
     :authentication       => :login,
     :enable_starttls_auto => true
  }
end

ActionMailer::Base.default_url_options[:host] = ENV['DOMAIN']
