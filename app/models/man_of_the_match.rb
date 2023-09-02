class ManOfTheMatch < ApplicationRecord
  belongs_to :inning
  belongs_to :player
  belongs_to :match
  belongs_to :team
end
