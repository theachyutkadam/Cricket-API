class Team < ApplicationRecord
  belongs_to :captain, class_name: "Player"
  belongs_to :vice_captain, class_name: "Player", optional: true

  has_many :matches, dependent: :destroy
end
