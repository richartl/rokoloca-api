require 'rails_helper'

RSpec.describe Song, type: :model do
  it { should validate_presence_of(:url) }
  it { should belong_to(:playlist) }
end
