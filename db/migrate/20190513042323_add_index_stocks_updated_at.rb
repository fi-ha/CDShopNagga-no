class AddIndexStocksUpdatedAt < ActiveRecord::Migration[5.2]
  def change
  	add_index :stocks, :updated_at
  end
end
