# Song Model Class
class Song < ApplicationRecord
  validates :url, presence: true
  belongs_to :playlist

  after_create_commit do
    SongCreationEventBroadcastJob.perform_later(self)
  end
end
