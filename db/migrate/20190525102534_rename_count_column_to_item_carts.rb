class RenameCountColumnToItemCarts < ActiveRecord::Migration[5.2]
  def change
    rename_column :item_carts, :count, :item_count
  end
end
