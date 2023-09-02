class Inning < ApplicationRecord
  belongs_to :match
  belongs_to :bat_team
  belongs_to :first_umpire
  belongs_to :second_umpire
end
