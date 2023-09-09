# frozen_string_literal: true

class ApplicationController < ActionController::API
  def health
    records = ApplicationRecord.record_count
    render json: { count: records, message: "Good Helth" }
  end
end
