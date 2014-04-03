# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
CoffeetalkApp::Application.initialize!

# CoffeetalkApp::Application.configure do
#   config.action_mailer.delivery_method = :smtp
#   config.action_mailer.smtp_settings = {
#     address:              'smtp.gmail.com',
#     port:                 587,
#     domain:               'http://cherry-cake-2455.herokuapp.com/',
#     user_name:            ENV['COFFEETALK_USERNAME'],
#     password:             ENV['COFFEETALK_PASSWORD'],
#     authentication:       'plain',
#     enable_starttls_auto: true  }
# end
