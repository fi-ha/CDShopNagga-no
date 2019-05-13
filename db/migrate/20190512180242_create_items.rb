class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :label_id, foreign_key: true
      t.string :item_name
      t.string :image_id
      t.integer :price
      t.text :description
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
