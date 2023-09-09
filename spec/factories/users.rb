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
    password { "MyString" }
    email { "MyString" }
    status { 1 }
    is_admin { false }
    token { "MyString" }
    user_type { 1 }
  end
end
