class CreateItemGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :item_genres do |t|
      t.integer :item_id, foreign_key: true
      t.integer :genre_id, foreign_key: true

      t.timestamps
    end
  end
end
