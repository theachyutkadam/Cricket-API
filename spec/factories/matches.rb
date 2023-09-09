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
#  toss_dicision      :integer          not null
#  won_by_runs        :integer
#  won_by_wicket      :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  team1_id           :bigint           not null
#  team2_id           :bigint           not null
#  toss_winer_team_id :bigint           not null
#  winner_team_id     :bigint           not null
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
FactoryBot.define do
  factory :match do
    team1 { nil }
    team2 { nil }
    number_of_overs { 1 }
    winner_team { nil }
    is_draw { false }
    start_at { "2023-09-02 22:23:05" }
    end_at { "2023-09-02 22:23:05" }
    toss_winer_team { nil }
    won_by_wicket { 1 }
    won_by_runs { 1 }
    match_draw_reason { "MyText" }
    toss_dicision { 1 }
  end
end
