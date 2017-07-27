module Rewards
  class BotBonusRequest < ActiveModelSerializers::Model
    attributes :text

    def id
      "bot-bonus-request"
    end
  end

  class BotBonusRequestSerializer < ActiveModel::Serializer
    type "bot-bonus-requests"
    attributes :text
  end
end
