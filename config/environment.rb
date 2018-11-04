# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Require carrierwave after ActiveRecord is loaded
require "carrierwave/orm/activerecord"
