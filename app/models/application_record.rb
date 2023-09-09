# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.record_count
    record_hash = {}
    Rails.logger.debug "***************************************"
    record_hash["user"] = User.count
    record_hash["player"] = Player.count
    record_hash["team"] = Team.count
    record_hash["match"] = Match.count
    record_hash["inning"] = Inning.count
    record_hash["over"] = Over.count
    record_hash["man_of_the_match"] = ManOfTheMatch.count
    record_hash["gift"] = Gift.count
    Rails.logger.debug record_hash.sort.to_h
    Rails.logger.debug "***************************************"
    record_hash.sort_by(&:last).to_h
  end
end
