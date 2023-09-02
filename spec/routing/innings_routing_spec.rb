require "rails_helper"

RSpec.describe InningsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/innings").to route_to("innings#index")
    end

    it "routes to #show" do
      expect(:get => "/innings/1").to route_to("innings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/innings").to route_to("innings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/innings/1").to route_to("innings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/innings/1").to route_to("innings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/innings/1").to route_to("innings#destroy", :id => "1")
    end
  end
end
