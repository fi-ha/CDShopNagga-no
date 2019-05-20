class ItemGenre < ApplicationRecord
	# アソシエーション設定
	belongs_to :genre
	belongs_to :item, optional: true
end
