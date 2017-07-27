require "webmock/rspec"
require "byebug"

require "rewards"
require "support/helpers"
require "support/shared_examples"

# Patch WebMock to parse JSON API requests as json
module WebMock
  class BodyPattern
    BODY_FORMATS.merge!("application/vnd.api+json" => :json)
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end
