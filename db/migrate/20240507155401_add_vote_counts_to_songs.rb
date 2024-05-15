class AddVoteCountsToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :good_votes_count, :integer, default: 0
    add_column :songs, :bad_votes_count, :integer, default: 0
    add_column :songs, :average_votes_count, :integer, default: 0
    add_column :songs, :want_to_sing_votes_count, :integer, default: 0
  end
end
