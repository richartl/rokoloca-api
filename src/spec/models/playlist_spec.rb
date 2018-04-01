require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:uuid) }
  it { should have_many(:songs) }
  it { should have_db_column(:uuid) }
  it { should have_db_index(:uuid) }
end
