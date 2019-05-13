class AddIndexItemSingersItemSingerId < ActiveRecord::Migration[5.2]
  def change
  	add_index :item_singers, [:item_singer_id, :singer_id]
  end
end
