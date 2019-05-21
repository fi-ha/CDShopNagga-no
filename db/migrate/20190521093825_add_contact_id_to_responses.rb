class AddContactIdToResponses < ActiveRecord::Migration[5.2]
  def change
    add_column :responses, :contact_id, :integer
  end
end
