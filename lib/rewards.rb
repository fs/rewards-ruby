require "httparty"
require "active_model_serializers"

class BotTokenRequest < ActiveModelSerializers::Model
  attributes :name, :password
end

class BotTokenRequestSerializer < ActiveModel::Serializer
  attributes :name, :password
end

class BotBonusRequest < ActiveModelSerializers::Model
  attributes :text
end

class BotBonusRequestSerializer < ActiveModel::Serializer
  attributes :text
end

class Rewards
  include HTTParty

  base_uri "https://rewards.flts.tk/api/v1"
  headers "Content-Type" => "application/vnd.api+json"
  headers "Accept" => "application/vnd.api+json"

  format :json

  attr_reader :token

  def initialize(token: nil)
    @token = token
  end

  def bot_create_token(name, password)
    request = BotTokenRequest.new(name: name, password: password)

    self.class.post("/bot/tokens", body: serialize_to_jsonapi(request))
  end

  def bot_create_bonus(text)
    request = BotBonusRequest.new(text: text)

    self.class.post("/bot/bonuses",
      body: serialize_to_jsonapi(request),
      headers: authorization_header)
  end

  def bot_users
    self.class.get("/bot/users", headers: authorization_header)
  end

  private

  def serialize_to_jsonapi(resource)
    ActiveModelSerializers::SerializableResource.new(resource, adapter: :json_api).to_json
  end

  def authorization_header
    { "Authorization": "Bearer #{token}" }
  end
end
