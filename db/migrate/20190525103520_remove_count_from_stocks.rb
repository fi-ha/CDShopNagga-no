class RemoveCountFromStocks < ActiveRecord::Migration[5.2]
  def change
    remove_column :stocks, :count, :integer
  end
end
