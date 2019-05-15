class Item < ApplicationRecord
	# フォームを保存する際に以下のバリデーションを設定している
	validates :item_name, presence: true
	validates :image_id, presence: true
	validates :price, presence: true
	validates :description, presence: true
	validates :active, presence: true

	# アソシエーション設定
	has_many :songs, dependent: :destroy
	has_many :item_genres, dependent: :destroy
	has_many :item_singers, dependent: :destroy
	has_many :singers, through: :item_singers
	has_many :item_carts, dependent: :destroy
	has_many :stocks, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	belongs_to :label

	#画像
	attachment :image_id
end
