# frozen_string_literal: true

class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: {error: "not-found"}.to_json, status: 404
  end
end
