class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      # references = belongs_toこれをやると固くdbを作れる_idは不要
      t.references :user,            foreign_key: true
      t.references :ship_to_another, foreign_key: true
      t.integer    :payment
      t.integer    :total_price
      t.integer    :status,          default:     1
      t.datetime   :created_at
      t.datetime   :updated_at,      index:       true

      t.timestamps
    end
  end
end
