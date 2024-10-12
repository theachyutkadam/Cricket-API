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
FactoryBot.define do
  factory :match do
    # team1 { nil }
    # team2 { nil }
    # winner_team { nil }
    # toss_winer_team { nil }
    number_of_overs { [5, 10, 15, 20].sample }
    status { Match.statuses.keys.sample }
    is_draw { false }
    start_at { Faker::Date.forward(days: 1) }
    end_at { Faker::Date.forward(days: 1) if status == 'finished' || status == 'draw'}
    # won_by_wicket { 1 }
    # won_by_runs { 1 }
    match_draw_reason { "none" }
    toss_dicision { 0 }
    # toss_dicision { Match.toss_dicisions.keys.sample }
  end
end
