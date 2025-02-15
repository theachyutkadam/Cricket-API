# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins "example.com"
#
#     resource "*",
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end
# 192.168.61.77
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins [
      "http://127.0.0.1:4200",
      "http://127.0.0.1:1025",
      "http://localhost:4200",
      "http://localhost:1025",
      "http://10.71.23.106:8000",
      "http://localhost:8000",
      "http://localhost:5173",
      "http://192.168.1.40:1025",
      "http://192.168.1.38:1025",
      "http://192.168.1.39:1025",
      "http://192.168.1.39:4200",
      "http://192.168.1.40:4200",

      # Ravikiran router
      "http://192.168.31.168:4200",
      "http://192.168.31.168:1025",
    ]
    resource "*", headers: :any, methods: %i[get post patch put delete options]
  end
end
