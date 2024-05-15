class AddSongTypeToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :song_type, :string
  end
end
