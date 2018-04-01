# Playlist Model Class
class Playlist < ApplicationRecord
  validates :name, presence: true
  validates :uuid, presence: true
  has_many :songs
end
