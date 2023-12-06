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
class User < ApplicationRecord
  has_one :player, dependent: :destroy

  enum status: { active: 0, pending: 1, blocked: 2, deleted: 3 }, _default: "active"
  enum user_type: { admin: 0, player: 1, other: 2 }, _default: "player"

  before_create :set_token

  validates :email, :password, :token, presence: true
  validates :is_admin, inclusion: [true, false]
  validates :status, inclusion: { in: statuses.keys }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { in: 6..16 }

  def generate_token
    user_token = Faker::Internet.device_token
    generate_token if User.where(token: user_token).any?
    user_token
  end

  def set_token
    self.token = generate_token
  end
end
