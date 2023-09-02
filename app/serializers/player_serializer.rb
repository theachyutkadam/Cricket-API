class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :middle_name, :last_name, :contact, :gender, :birth_date, :speciality
  has_one :user
end
