module Api
  module V1
    # Playlist serializer
    class PlaylistSerializer < ActiveModel::Serializer
      attributes :id, :name, :uuid
      has_many :songs
    end
  end
end
