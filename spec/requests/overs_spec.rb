# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Overs", type: :request do
  describe "GET /overs" do
    it "works! (now write some real specs)" do
      get overs_path
      expect(response).to have_http_status(200)
    end
  end
end
