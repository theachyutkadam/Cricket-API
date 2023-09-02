require "rails_helper"

RSpec.describe OversController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/overs").to route_to("overs#index")
    end

    it "routes to #show" do
      expect(:get => "/overs/1").to route_to("overs#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/overs").to route_to("overs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/overs/1").to route_to("overs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/overs/1").to route_to("overs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/overs/1").to route_to("overs#destroy", :id => "1")
    end
  end
end
