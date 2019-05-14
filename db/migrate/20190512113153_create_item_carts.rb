class CreateItemCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :item_carts do |t|
      # references = belongs_toこれをやると固くdbを作れる_idは不要
      t.references :item, foreign_key: true
      t.references :cart, foreign_key: true
      t.integer    :count
      t.integer    :price
      t.datetime   :created_at
      t.datetime   :updated_at

      t.timestamps
    end
  end
end
