class Match < ApplicationRecord
  belongs_to :team1
  belongs_to :team2
  belongs_to :winner_team
  belongs_to :toss_winer_team_id
end
