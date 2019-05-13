class AddIndexToLabel < ActiveRecord::Migration[5.2]
  def change
    add_index :labels, :label_name
  end
end
