# frozen_string_literal: true

# == Schema Information
#
# Table name: gifts
#
#  id             :bigint           not null, primary key
#  amount         :float
#  description    :text
#  name_of_donner :string
#  reason         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  inning_id      :bigint           not null
#  match_id       :bigint           not null
#  player_id      :bigint           not null
#  team_id        :bigint           not null
#
# Indexes
#
#  index_gifts_on_inning_id  (inning_id)
#  index_gifts_on_match_id   (match_id)
#  index_gifts_on_player_id  (player_id)
#  index_gifts_on_team_id    (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (inning_id => innings.id)
#  fk_rails_...  (match_id => matches.id)
#  fk_rails_...  (player_id => players.id)
#  fk_rails_...  (team_id => teams.id)
#
require "rails_helper"

RSpec.describe Gift, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
