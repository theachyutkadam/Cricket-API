# frozen_string_literal: true

# == Schema Information
#
# Table name: matches
#
#  id                 :bigint           not null, primary key
#  end_at             :datetime
#  is_draw            :boolean
#  match_draw_reason  :text
#  number_of_overs    :integer          not null
#  start_at           :datetime
#  status             :integer          not null
#  toss_dicision      :integer          not null
#  won_by_runs        :integer          default(0)
#  won_by_wicket      :integer          default(0)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  team1_id           :bigint           not null
#  team2_id           :bigint           not null
#  toss_winer_team_id :bigint           not null
#  winner_team_id     :bigint
#
# Indexes
#
#  index_matches_on_team1_id            (team1_id)
#  index_matches_on_team2_id            (team2_id)
#  index_matches_on_toss_winer_team_id  (toss_winer_team_id)
#  index_matches_on_winner_team_id      (winner_team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team1_id => teams.id)
#  fk_rails_...  (team2_id => teams.id)
#  fk_rails_...  (toss_winer_team_id => teams.id)
#  fk_rails_...  (winner_team_id => teams.id)
#
class Match < ApplicationRecord
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"
  belongs_to :winner_team, class_name: "Team", optional: true
  belongs_to :toss_winer_team, class_name: "Team"
  has_many :innings, dependent: :destroy

  enum toss_dicision: { bating: 0, filding: 1 }
  enum status: { active: 0, upcomming: 1, finished: 2, draw: 3 }, _default: "upcomming"

  validates :number_of_overs, :start_at, presence: true
  validates :status, inclusion: { in: statuses.keys }
  validates :is_draw, inclusion: [true, false]
  validates :toss_dicision, inclusion: { in: toss_dicisions.keys }
  validates :number_of_overs, :won_by_runs, :won_by_wicket, numericality: { only_integer: true }
  validates :team1, exclusion: { in: lambda{ |match| [match.team2] }, msg: "Team2 must be different form Team1" }
  # validates_with ValuesNotEqualValidator, fields: [:team1, :team2], msg: "Team2 must be different form Team1"
end
