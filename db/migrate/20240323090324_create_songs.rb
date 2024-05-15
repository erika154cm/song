class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :aritist
      t.text :year
      t.string :about
      t.string :select
      t.string :person

      t.timestamps
    end
  end
end
