class Cart < ApplicationRecord
  # アソシエーション設定
  belongs_to :user            # usersモデルにアソシエーション
  has_many   :item_carts      # item_carts中間モデルにアソシエーション
  has_one    :ship_to_another # ship_to_anotherモデルにアソシエーション
end
