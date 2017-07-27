module Helpers
  def fixture(name)
    File.new("spec/fixtures/#{name}.json")
  end

  def json_fixture(name)
    JSON.parse(fixture(name).read)
  end

  def stub_rewards_request(method, endpoint, token: nil, request: nil, response: nil)
    stub_request(method, "#{base_uri}#{endpoint}").tap do |stub|
      stub.with(headers: { "Accept": "application/vnd.api+json", "Content-Type": "application/vnd.api+json" })
      stub.with(headers: { "Authorization": "Bearer #{token}" }) if token.present?
      stub.with(body: json_fixture(request)) if request.present?
      stub.to_return(fixture(response)) if response.present?
    end
  end
end

RSpec.configure do |config|
  config.include Helpers
end
