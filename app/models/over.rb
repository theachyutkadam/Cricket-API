class Over < ApplicationRecord
  belongs_to :strick_batsman
  belongs_to :non_strick_batsman
  belongs_to :bowler
  belongs_to :inning
end
