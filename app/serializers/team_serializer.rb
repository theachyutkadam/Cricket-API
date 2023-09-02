class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :state, :city, :location, :contact
  has_one :captain
  has_one :vice_captain
end
