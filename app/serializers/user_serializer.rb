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
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :status, :is_admin, :user_type
end
