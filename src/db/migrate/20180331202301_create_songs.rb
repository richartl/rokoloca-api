# Songs migration
class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :url, null: false
      t.references :playlist
      t.timestamps
    end
  end
end
