class CreateItemSingers < ActiveRecord::Migration[5.2]
  def change
    create_table :item_singers do |t|
      t.integer :item_id, foreign_key: true
      t.integer :singer_id, foreign_key: true

      t.timestamps
    end
  end
end
