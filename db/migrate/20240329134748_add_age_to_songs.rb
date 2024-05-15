class AddAgeToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :age, :integer
  end
end
