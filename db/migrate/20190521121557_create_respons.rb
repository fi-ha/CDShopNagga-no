class CreateRespons < ActiveRecord::Migration[5.2]
  def change
    create_table :respons do |t|
      t.integer :contact_id
      t.string :respon_name
      t.string :subject
      t.text :body
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
