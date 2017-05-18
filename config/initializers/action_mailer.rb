# Be sure to restart your server when you modify this file.
# /config/initializers/action_mailer.rb..

# ActionMailer email configuration
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.zoho.com", #ENV['SMTP_ADDRESS'],
  :port                 => 465, # ENV['SMTP_PORT'],
  :domain               => Rails.env == 'production' ? "advisorydb.com" : "localhost", # ENV['SMTP_DOMAIN'],
  :user_name            => "do-not-reply@advisorydb.com", #ENV['SMTP_USERNAME'],
  :password             => "ActionMailer!", #ENV['SMTP_PASSWORD'],
  :authentication       => :login,
  :enable_starttls_auto => true,
  :ssl 					=> true
}
