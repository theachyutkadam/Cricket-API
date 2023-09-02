class Inning < ApplicationRecord
  belongs_to :match
  belongs_to :bat_team, class_name: "Team"
  belongs_to :first_umpire, class_name: "Player"
  belongs_to :second_umpire, class_name: "Player"

  has_many :overs, dependent: :destroy
end
