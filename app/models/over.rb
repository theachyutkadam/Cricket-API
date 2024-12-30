# frozen_string_literal: true

# == Schema Information
#
# Table name: overs
#
#  id                    :bigint           not null, primary key
#  ball_status           :integer          not null
#  bowled_in_over        :integer          default(0)
#  over_number           :integer          default(0), not null
#  real_ball_number      :integer          default(0), not null
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
class Over < ApplicationRecord
  belongs_to :strick_batsman, class_name: "Player"
  belongs_to :non_strick_batsman, class_name: "Player"
  belongs_to :bowler, class_name: "Player"
  belongs_to :inning

  enum run_type: { no_run: 0, single_run: 1, double_run: 2, triple_run: 3, four: 4, five: 5, six: 6 }, _default: "no_run"
  enum ball_status: { good_ball: 0, wide: 1, no_ball: 2, dot_ball: 3, free_hit: 4 }, _default: "good_ball"
  enum wicket_type: { run_out: 0, bold: 1, catch: 2, lbw: 3 }

  validates :run_type, inclusion: { in: run_types.keys }
  validates :ball_status, inclusion: { in: ball_statuses.keys }
  validates :wicket_type, inclusion: { in: wicket_types.keys }
  validates :bowled_in_over, :over_number, :real_ball_number, :total_runs, presence: true
  validates :bowled_in_over, :over_number, :real_ball_number, :total_runs, numericality: { only_integer: true }
  validate :is_over_finished?

  before_validation :update_over_status

  def is_over_finished?
    fetch_last_ball_record
    errors.add(:real_ball_number, "Over Completed") if @last_ball_record.real_ball_number == 6
  end

  def update_score
    self.total_runs = @last_ball_record.total_runs + 1 if self.ball_status == 1
    self.total_runs = @last_ball_record.total_runs + self.run_type
  end

  def update_over_status
    fetch_last_ball_record
    return if @last_ball_record.blank?

    update_over
    self.bowled_in_over = @last_ball_record.bowled_in_over + 1
    self.bowled_in_over = 1 if self.over_number != @last_ball_record.over_number

    if self.ball_status == 0 || self.wicket_type.present?
      self.real_ball_number = @last_ball_record.real_ball_number + 1
      self.ball_status = 0
    end
    update_score
  end

  def update_over
    return self.over_number = @last_ball_record.over_number + 1 if @last_ball_record.real_ball_number == 6
    self.over_number = @last_ball_record.over_number
  end

  def fetch_last_ball_record
    @last_ball_record = Over.where(inning_id: self.inning_id).order("created_at").last
  end
end
