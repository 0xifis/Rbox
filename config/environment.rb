# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Rbox::Application.initialize!

# Formatting Data/Time
Time::DATE_FORMATS[:default] = "%d/%m/%Y %l:%M%p"
