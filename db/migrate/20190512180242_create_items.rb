class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :label_id
      t.string :item_name
      t.string :image_id
      t.integer :price
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
