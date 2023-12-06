# frozen_string_literal: true

# == Schema Information
#
# Table name: overs
#
#  id                    :bigint           not null, primary key
#  ball_status           :integer          not null
#  bowled_in_over        :integer          default(1)
#  over_number           :integer          default(1), not null
#  real_ball_number      :integer          default(1), not null
#  run_type              :integer
#  total_runs            :integer          default(0), not null
#  wicket_type           :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  bowler_id             :bigint           not null
#  inning_id             :bigint
#  non_strick_batsman_id :bigint           not null
#  strick_batsman_id     :bigint           not null
#
# Indexes
#
#  index_overs_on_bowler_id              (bowler_id)
#  index_overs_on_inning_id              (inning_id)
#  index_overs_on_non_strick_batsman_id  (non_strick_batsman_id)
#  index_overs_on_strick_batsman_id      (strick_batsman_id)
#
# Foreign Keys
#
#  fk_rails_...  (bowler_id => players.id)
#  fk_rails_...  (inning_id => innings.id)
#  fk_rails_...  (non_strick_batsman_id => players.id)
#  fk_rails_...  (strick_batsman_id => players.id)
#
FactoryBot.define do
  factory :over do
    # real_ball_number { 1 }
    run_type { Over.run_types.keys.sample }
    ball_status { Over.ball_statuses.keys.sample }
    wicket_type { Over.wicket_types.keys.sample }
    # strick_batsman { nil }
    # non_strick_batsman { nil }
    # bowler { nil }
    # bowled_in_over { 1 }
    # total_runs { 1 }
    # over_number { 1 }
    # inning { nil }
  end
end
