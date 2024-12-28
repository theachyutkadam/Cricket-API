# frozen_string_literal: true

# == Schema Information
#
# Table name: players
#
#  id          :bigint           not null, primary key
#  birth_date  :date
#  contact     :string           not null
#  first_name  :string           not null
#  last_name   :string           not null
#  middle_name :string
#  gender      :integer          not null
#  speciality  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_players_on_contact  (contact) UNIQUE
#  index_players_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :contact, :gender, :birth_date, :speciality, :name, :first_name, :last_name, :middle_name, :user_id
  has_one :user

  def name
    object.full_name
  rescue StandardError
    nil
  end

  # def user
  #   object.user
  # end
end
