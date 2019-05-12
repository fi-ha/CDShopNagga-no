class CreateItemSingers < ActiveRecord::Migration[5.2]
  def change
    create_table :item_singers do |t|
      t.integer :item_id
      t.integer :singer_id

      t.timestamps
    end
  end
end
