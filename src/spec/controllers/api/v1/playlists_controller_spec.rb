require 'rails_helper'

RSpec.describe Api::V1::PlaylistsController, type: :controller do
  after(:each) do
    DatabaseCleaner.clean
  end

  let(:playlist) { create :playlist }

  describe '#GET show' do
    it 'when send empty uuid' do
      get :show, params: {
        id: ''
      }

      expect(response).to have_http_status(422)
      expect(response.body).to match_response_schema('errors')
    end

    it 'when send wrong uuid' do
      get :show, params: {
        id: 'test'
      }

      expect(response).to have_http_status(404)
      expect(response.body).to match_response_schema('errors')
    end

    it 'when send correct uuid' do
      get :show, params: {
        id: playlist.uuid
      }

      expect(response).to have_http_status(200)
      expect(response.body).to match_response_schema('playlists')
    end
  end
end
