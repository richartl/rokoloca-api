# Playlist controller for api v1
module Api
  module V1
    # Controller for playlist
    class PlaylistsController < BaseController
      include Swagger::Blocks
      before_action :validation

      def index
        'hola'
      end

      def show
        playlist = Playlist.find_by!(uuid: params_permit['id'])
        render json: playlist,
               include: 'songs',
               fields: { songs: ['url'] }
      end

      private

      # This method validates the query params with rails_param gem
      # @private
      def validation
        param! :id, String, required: true, blank: false
      end

      # Params permit for show
      def params_permit
        params.permit(:id)
      end
    end
  end
end
