# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Innings", type: :request do
  describe "GET /innings" do
    it "works! (now write some real specs)" do
      get innings_path
      expect(response).to have_http_status(200)
    end
  end
end
