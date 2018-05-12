require 'rails_helper'

RSpec.describe Playlist, type: :model do
  let(:playlist) { build :playlist }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:uuid) }
  it { should have_many(:songs) }
  it { should have_db_column(:uuid) }
  it { should have_db_index(:uuid) }

  it 'before save the uuid is set' do
    expect(playlist.uuid).not_to eq(nil)
  end
end
