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
class User < ApplicationRecord
  belongs_to :role
  has_one :player, dependent: :destroy
  enum status: { active: 0, pending: 1, blocked: 2, deleted: 3 }, _default: "active"

  before_validation :set_role

  validates :email, :password, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true
  validates :status, inclusion: { in: statuses.keys }
  validates :password, length: { in: 6..12 }
  validate :is_single_admin

  scope :players, -> { where(:role_id => Role.where(name: "player").first.id)}
  scope :viwers, -> { where(:role_id => Role.where(name: "viwer").first.id)}
  scope :admins, -> { where(:role_id => Role.where(name: "admin").first.id)}
  # Ex:- scope :active, -> {where(:active => true)}
  def is_single_admin
    errors.add(:role_id, "Only one Admin Role allowed") if User.where(role_id: self.role_id == 1).any?
  end

  def generate_token
    user_token = Faker::Internet.device_token
    generate_token if User.where(token: user_token).any?
    user_token
  end

  def set_token
    self.token = generate_token
  end

  def set_role
    self.role = Role.where(name: "viwer").first unless self.role_id
  end

end
