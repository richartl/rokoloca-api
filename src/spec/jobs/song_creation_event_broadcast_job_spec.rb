require 'rails_helper'

RSpec.describe SongCreationEventBroadcastJob, type: :job do
  include ActiveJob::TestHelper
  playlist = Playlist.create name: 'Test'
  song = Song.create url: 'https://www.youtube.com/watch?v=7NnANkIxGCg', playlist: playlist
  subject(:job) { described_class.perform_later(song) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in default queue' do
    expect(SongCreationEventBroadcastJob.new.queue_name).to eq('default')
  end

  it 'executes perform' do
    expect {
      perform_enqueued_jobs { job }
    }.to have_broadcasted_to(playlist.uuid).from_channel(PlaylistChannel).with({
      event: 'add',
      data: {
        url: song.url
      }
    })

  end
end
