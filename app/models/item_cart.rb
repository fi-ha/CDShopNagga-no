class ItemCart < ApplicationRecord
	# アソシエーション設定
	belongs_to :item
	belongs_to :cart
end
 