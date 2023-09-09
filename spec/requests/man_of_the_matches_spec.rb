# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ManOfTheMatches", type: :request do
  describe "GET /man_of_the_matches" do
    it "works! (now write some real specs)" do
      get man_of_the_matches_path
      expect(response).to have_http_status(200)
    end
  end
end
