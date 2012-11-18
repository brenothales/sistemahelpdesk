# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
PrimeiraApp::Application.initialize!
Sass::Plugin.options[:never_update] = true