
# Configurations for Devise gem
# Included in controller spec files
RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :request
end