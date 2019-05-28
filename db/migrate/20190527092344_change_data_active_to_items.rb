class ChangeDataActiveToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :active, :integer
  end
end
