# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id              :bigint           not null, primary key
#  city            :string
#  contact         :string           not null
#  location        :string
#  name            :string           not null
#  state           :string
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  captain_id      :bigint           not null
#  vice_captain_id :bigint
#
# Indexes
#
#  index_teams_on_captain_id       (captain_id)
#  index_teams_on_vice_captain_id  (vice_captain_id)
#
# Foreign Keys
#
#  fk_rails_...  (captain_id => players.id)
#  fk_rails_...  (vice_captain_id => players.id)
#
class Team < ApplicationRecord
  belongs_to :captain, class_name: "Player"
  belongs_to :vice_captain, class_name: "Player", optional: true

  has_many :matches, dependent: :destroy

  enum status: { active: 0, pending: 1, blocked: 2 }, _default: "active"
end
