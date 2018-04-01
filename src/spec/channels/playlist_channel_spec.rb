require 'rails_helper'

RSpec.describe PlaylistChannel, type: :channel do
  let(:playlist) { Playlist.create(name: 'Test') }

  it 'test rejected when not send uuid' do
    subscribe
    expect(subscription).to be_rejected
    assert_equal connection.transmissions[0][:error], 'No uuid specified'
  end

  it 'test rejected when playlist doesnt exists' do
    subscribe uuid: 'test-uuid'
    expect(subscription).to be_rejected
    assert_equal connection.transmissions[0][:error], 'Playlist does\'nt exist'
  end

  it 'test_suscribe' do
    subscribe uuid: playlist.uuid
    assert subscription.confirmed?
  end

  it 'test_suscribe_to_playlist' do
    #allow(Playlist).to receive(:find_by!).and_return(playlist)
    subscribe uuid: playlist.uuid
    assert subscription.confirmed?
    expect(streams).to include(playlist.uuid)
  end

  it 'test rejected by url empty' do
    subscribe uuid: playlist.uuid
    perform :create, url: ''
    expect(subscription).to be_rejected
  end

  it 'test rejected by url nil' do
    subscribe uuid: playlist.uuid
    perform :create, url: nil
    expect(subscription).to be_rejected
  end

  it 'test create song when publish to songs' do
    subscribe uuid: playlist.uuid
    song_url = 'https://www.youtube.com/watch?v=7NnANkIxGCg'
    perform :create, url: song_url
    expect(subscription).to be_confirmed
    assert_equal Song.last.url, song_url
  end

  it 'test create song and belongs to playlist' do
    subscribe uuid: playlist.uuid
    song_url = 'https://www.youtube.com/watch?v=7NnANkIxGCg'
    perform :create, url: song_url
    expect(subscription).to be_confirmed
    assert_equal Song.last.playlist.uuid, playlist.uuid
  end

  #it 'test create song and transmit create Job' do
    #subscribe uuid: playlist.uuid
    #song_url = 'https://www.youtube.com/watch?v=7NnANkIxGCg'
    #ActiveJob::Base.queue_adapter = :test
    #expect {
      #perform :create, url: song_url
    #}.to have_enqueued_job(SongCreationEventBroadcastJob).with(Song.last)
  #end
end
