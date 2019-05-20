class Genre < ApplicationRecord
  # アソシエーション設定
  has_many :item_genres #itemsとgenresの中間テーブルへのアソシエーション
  has_many :items, through: :item_genres

  # フォームを保存する際に以下のバリデーションを設定している
  validates :genre_name,
		     presence: true, # 空では無い
    		 uniqueness: true # 他と同じでは無い

end
