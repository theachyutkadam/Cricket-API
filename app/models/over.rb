# frozen_string_literal: true

# == Schema Information
#
# Table name: overs
#
#  id                    :bigint           not null, primary key
#  ball_status           :integer          not null
#  bowled_in_over        :integer
#  over_number           :integer          not null
#  real_ball_number      :integer          not null
#  run_type              :integer
#  total_runs            :integer          not null
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
class Over < ApplicationRecord
  belongs_to :strick_batsman, class_name: "Player"
  belongs_to :non_strick_batsman, class_name: "Player"
  belongs_to :bowler, class_name: "Player"
  belongs_to :inning

  enum run_type: { no_run: 0, single_run: 1, double_run: 2, triple_run: 3, four: 4, five: 5, six: 6 }
  enum ball_status: { wide: 0, no_ball: 1, dot_ball: 2, free_hit: 3}
  enum wicket_type: { run_out: 0, bold: 1, catch: 2}
end
