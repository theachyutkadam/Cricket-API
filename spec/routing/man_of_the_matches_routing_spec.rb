# frozen_string_literal: true

require "rails_helper"

RSpec.describe ManOfTheMatchesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/man_of_the_matches").to route_to("man_of_the_matches#index")
    end

    it "routes to #show" do
      expect(get: "/man_of_the_matches/1").to route_to("man_of_the_matches#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/man_of_the_matches").to route_to("man_of_the_matches#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/man_of_the_matches/1").to route_to("man_of_the_matches#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/man_of_the_matches/1").to route_to("man_of_the_matches#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/man_of_the_matches/1").to route_to("man_of_the_matches#destroy", id: "1")
    end
  end
end
