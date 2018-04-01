# Not Found exception for connection cable
class NotFoundPlaylistException < ConnectionException
  def initialize(msg="Not found playlist")
    super
  end
end
