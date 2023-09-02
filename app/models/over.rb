class Over < ApplicationRecord
  belongs_to :strick_batsman, class_name: "Player"
  belongs_to :non_strick_batsman, class_name: "Player"
  belongs_to :bowler, class_name: "Player"
  belongs_to :inning
end
