RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include Warden::Test::Helpers, type: :feature

  Warden.test_mode!
end
