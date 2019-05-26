class ItemCart < ApplicationRecord
	# アソシエーション設定
	belongs_to :item
	belongs_to :cart

  def commerce_price
  	price * item_count.to_i
  end
end
