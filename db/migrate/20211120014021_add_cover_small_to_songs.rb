class AddCoverSmallToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :cover_small, :string
  end
end
