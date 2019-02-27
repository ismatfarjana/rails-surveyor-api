# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Mongoid.raise_not_found_error = false
