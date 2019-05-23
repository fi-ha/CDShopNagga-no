class Stock < ApplicationRecord
	# アソシエーション設定
	belongs_to :item, optional: true
end
