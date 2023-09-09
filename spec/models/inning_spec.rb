# frozen_string_literal: true

# == Schema Information
#
# Table name: innings
#
#  id                   :bigint           not null, primary key
#  draw_reason          :text
#  end_at               :datetime
#  inning_type          :integer          not null
#  is_draw              :integer
#  number_of_wickets    :string           default("0"), not null
#  start_at             :datetime
#  target_to_opposition :string
#  total_runs           :integer          default(0), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  bat_team_id          :bigint           not null
#  first_umpire_id      :bigint           not null
#  match_id             :bigint
#  second_umpire_id     :bigint           not null
#
# Indexes
#
#  index_innings_on_bat_team_id       (bat_team_id)
#  index_innings_on_first_umpire_id   (first_umpire_id)
#  index_innings_on_match_id          (match_id)
#  index_innings_on_second_umpire_id  (second_umpire_id)
#
# Foreign Keys
#
#  fk_rails_...  (bat_team_id => teams.id)
#  fk_rails_...  (first_umpire_id => players.id)
#  fk_rails_...  (match_id => matches.id)
#  fk_rails_...  (second_umpire_id => players.id)
#
require "rails_helper"

RSpec.describe Inning, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
