class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      # ここでもバリデーション設定が可能。インデクス設定を行う
      t.string   :genre_name, index:  true,
                              null:   false,
                              unique: true
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
