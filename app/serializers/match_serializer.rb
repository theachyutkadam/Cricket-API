class MatchSerializer < ActiveModel::Serializer
  attributes :id, :number_of_overs, :is_draw, :start_at, :end_at, :won_by_wicket, :won_by_runs, :match_draw_reason, :toss_dicision
  has_one :team1
  has_one :team2
  has_one :winner_team
  has_one :toss_winer_team_id
end
