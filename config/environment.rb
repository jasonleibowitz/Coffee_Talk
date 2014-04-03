# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
CoffeetalkApp::Application.initialize!

CoffeetalkApp::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'localhost:3000',
    user_name:            '<username>',
    password:             '<password>',
    authentication:       'plain',
    enable_starttls_auto: true  }
end
