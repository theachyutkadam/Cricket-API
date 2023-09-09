# frozen_string_literal: true

# == Schema Information
#
# Table name: players
#
#  id          :bigint           not null, primary key
#  birth_date  :date
#  contact     :string           not null
#  first_name  :string           not null
#  gender      :integer          not null
#  last_name   :string           not null
#  middle_name :string
#  speciality  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_players_on_contact  (contact) UNIQUE
#  index_players_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Player, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
