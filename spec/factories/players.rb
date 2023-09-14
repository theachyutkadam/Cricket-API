# frozen_string_literal: true

# == Schema Information
#
# Table name: players
#
#  id          :bigint           not null, primary key
#  birth_date  :date
#  contact     :string           not null
#  first_name  :string           not null
#  gender      :integer          not null
#  last_name   :string           not null
#  middle_name :string
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
FactoryBot.define do
  factory :player do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    contact { Faker::Base.numerify("##########") }
    gender { Player.genders.keys.sample }
    birth_date { 18.years.ago }
    speciality { Player.specialities.keys.sample }
  end
end
