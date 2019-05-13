class CreateSingers < ActiveRecord::Migration[5.2]
  def change
    create_table :singers do |t|
      t.integer :singer_id
      t.string :singer_name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
