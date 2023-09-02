class OverSerializer < ActiveModel::Serializer
  attributes :id, :real_ball_number, :run_type, :ball_status, :wicket_type, :bowled_in_over, :total_runs, :over_number
  has_one :strick_batsman
  has_one :non_strick_batsman
  has_one :bowler
  has_one :inning
end
