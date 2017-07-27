describe Rewards::Client do
  let(:base_uri) { "https://rewards.flts.tk/api/v1" }
  let(:token) { "token" }
  let(:client) { described_class.new(token: token) }

  describe "#bot_create_token" do
    def do_request
      client.bot_create_token("example", "123456")
    end

    let!(:stubed_request) do
      stub_rewards_request(:post, "/bot/tokens",
        request: "token_request", response: "token")
    end

    it_behaves_like "JSON API Rewards method"

    it "returns token" do
      expect(do_request["data"]["attributes"]["token"]).to eql("token-id")
    end
  end

  describe "#bot_create_bonus" do
    let(:text) { "+100 for @timur.vafin for awesome work #awesome" }

    def do_request
      client.bot_create_bonus(text)
    end

    let!(:stubed_request) do
      stub_rewards_request(:post, "/bot/bonuses",
        token: token, request: "bonus_request", response: "bonus")
    end

    it_behaves_like "JSON API Rewards method"

    it "returns bonus" do
      expect(do_request["data"]["attributes"]["text"]).to eql(text)
    end
  end

  describe "#bot_users" do
    def do_request
      client.bot_users
    end

    let!(:stubed_request) do
      stub_rewards_request(:get, "/bot/users",
        token: token, response: "users")
    end

    it_behaves_like "JSON API Rewards method"
  end
end
