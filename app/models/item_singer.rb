class ItemSinger < ApplicationRecord
	# アソシエーション設定
	belongs_to :singer
	belongs_to :item
end
