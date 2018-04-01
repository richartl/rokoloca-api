# PlaylistChannel class
class PlaylistChannel < ApplicationCable::Channel
  def subscribed
    if !params[:uuid] || params[:uuid].empty?
      connection.transmit identifier: params, error: 'No uuid specified'
      reject
      return
    end

    @playlist = Playlist.find_by uuid: params[:uuid]
    unless @playlist
      connection.transmit identifier: params, error: 'Playlist does\'nt exist'
      reject
      return
    end

    stream_from @playlist.uuid
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast('songs', data)
  end

  def create(opts)
    if !opts['url'] || opts['url'].empty?
      connection.transmit identifier: params, error: 'No url song specified'
      reject
      return
    end
    song = Song.new(url: opts['url'], playlist: @playlist)
    song.save
  end
end
