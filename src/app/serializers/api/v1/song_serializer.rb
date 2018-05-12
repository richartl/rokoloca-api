module Api
  module V1
    # Song serializer
    class SongSerializer < ActiveModel::Serializer
      attributes :id, :url
      belongs_to :playlist
    end
  end
end
