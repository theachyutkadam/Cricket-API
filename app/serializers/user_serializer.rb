# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  password   :string           not null
#  status     :integer          not null
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role_id    :bigint           not null
#
# Indexes
#
#  index_users_on_email    (email) UNIQUE
#  index_users_on_role_id  (role_id)
#  index_users_on_token    (token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :status, :name


  def name
    object.email
  end
end
