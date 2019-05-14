class AddIndexToContact < ActiveRecord::Migration[5.2]
  def change
    add_index :contacts, :created_at
  end
end
