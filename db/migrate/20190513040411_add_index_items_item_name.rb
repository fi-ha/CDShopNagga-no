class AddIndexItemsItemName < ActiveRecord::Migration[5.2]
  def change
  	add_index :items, :item_name
  end
end
