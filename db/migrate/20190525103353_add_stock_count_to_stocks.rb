class AddStockCountToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :stock_count, :integer
  end
end
