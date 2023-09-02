class GiftSerializer < ActiveModel::Serializer
  attributes :id, :reason, :name_of_donner, :amount, :description
  has_one :inning
  has_one :player
  has_one :match
  has_one :team
end
