class CreateShipToAnothers < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_to_anothers do |t|
      t.string   :first_name,      null: false, limit: 20
      t.string   :last_name,       null: false, limit: 20
      t.string   :first_name_kana, null: false, limit: 20
      t.string   :last_name_kana,  null: false, limit: 20
      t.string   :postal_code,     null: false, limit: 7
      t.string   :address,         null: false, limit: 300
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
