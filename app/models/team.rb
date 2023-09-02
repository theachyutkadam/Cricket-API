class Team < ApplicationRecord
  belongs_to :captain
  belongs_to :vice_captain
end
