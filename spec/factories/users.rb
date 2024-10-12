# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  is_admin   :boolean
#  password   :string           not null
#  status     :integer          not null
#  token      :string           not null
#  user_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_token  (token) UNIQUE
#
FactoryBot.define do
  factory :user do
    password { "11223344" }
    email { Faker::Internet.email }
    # status { User.statuses.keys.sample }
    is_admin { false }
    token { Faker::Internet.device_token }
    user_type { User.user_types.keys.sample }
  end

  trait :with_player do
    after(:create) do |user|
      create(:player, user_id: user.id)
    end
  end
end
