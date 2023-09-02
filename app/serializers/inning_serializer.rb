class InningSerializer < ActiveModel::Serializer
  attributes :id, :inning_type, :total_runs, :number_of_wickets, :start_at, :end_at, :target_to_opposition, :is_draw, :draw_reason
  has_one :match
  has_one :bat_team
  has_one :first_umpire
  has_one :second_umpire
end
