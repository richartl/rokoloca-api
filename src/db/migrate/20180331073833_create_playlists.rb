# Create Playlist migration
class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.uuid :uuid, default: SecureRandom.uuid, index: true, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end


