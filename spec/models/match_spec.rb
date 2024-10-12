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
require "rails_helper"

RSpec.describe Match, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
