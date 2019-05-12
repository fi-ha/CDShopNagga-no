class AddIndexToResponse < ActiveRecord::Migration[5.2]
  def change
    add_index :responses, :created_at
  end
end
