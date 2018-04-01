FactoryBot.define do
  factory :playlist do
    name 'Cmere'
  end

  factory :playlist_test, class: 'Playlist' do
    name 'Cmere'
  end
end
