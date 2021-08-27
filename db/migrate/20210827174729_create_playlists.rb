class CreatePlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.string :title
      t.integer :song_count
      t.integer :user_id

      t.timestamps
    end
  end
end
