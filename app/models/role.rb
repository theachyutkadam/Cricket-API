# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord
  has_many :users, dependent: :destroy

  enum status: { active: 0, blocked: 1 }, _default: "active"

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :status, inclusion: { in: statuses.keys }

end
