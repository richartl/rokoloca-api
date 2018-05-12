# Playlist controller for api v1
module Api
  module V1
    class BaseController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound do |error|
        render json: { error: { status: 404,
                                code: 404,
                                message: error } },
               status: :not_found
      end

      rescue_from RailsParam::Param::InvalidParameterError do |error|
        render json: { error: { status: 422,
                                code: 422,
                                message: error } },
               status: :unprocessable_entity
      end
    end
  end
end
