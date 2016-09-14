require_relative 'helpers/omniauth'

RSpec.configure do |config|
  config.include Omniauth::Mock
  config.include Omniauth::SessionHelpers, type: :feature
  config.include Omniauth::MessagingHelpers, type: :feature
end
OmniAuth.config.test_mode = true
