class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :item_id
      t.string :song_name
      t.string :disk
      t.integer :number

      t.timestamps
    end
  end
end
