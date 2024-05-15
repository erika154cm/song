class AddComposerToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :composer, :string
  end
end
