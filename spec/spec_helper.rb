require_relative "support/controller_helpers"
require "devise"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # devise / warden
  config.include ControllerHelpers, type: :controller
  config.include ControllerHelpers, type: :feature
  config.include ControllerHelpers, type: :request

  Warden.test_mode!

  config.after do
    Warden.test_reset!
  end
end
