class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
