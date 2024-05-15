class AddVotedSongIdsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :voted_song_ids, :integer, array: true, default: []
  end
end
