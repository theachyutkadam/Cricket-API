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
    first_name { "MyString" }
    middle_name { "MyString" }
    last_name { "MyString" }
    contact { "MyString" }
    gender { 1 }
    birth_date { "2023-09-02" }
    speciality { 1 }
    user { nil }
  end
end
