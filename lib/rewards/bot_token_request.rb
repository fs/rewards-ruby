module Rewards
  class BotTokenRequest < ActiveModelSerializers::Model
    attributes :name, :password

    def id
      "bot-token-request"
    end
  end

  class BotTokenRequestSerializer < ActiveModel::Serializer
    type "bot-token-requests"
    attributes :name, :password
  end
end
