# Playlist Job
class SongCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(song)
    ActionCable
      .server
      .broadcast(song.playlist.uuid,
                 event: 'add',
                 data: {
                   url: song.url
                 })
  end
end
