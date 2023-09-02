class ManOfTheMatchSerializer < ActiveModel::Serializer
  attributes :id, :reason
  has_one :inning
  has_one :player
  has_one :match
  has_one :team
end
