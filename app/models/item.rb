class Item < ApplicationRecord
	validates :item_name, presence: true
	validates :image_id, presence: true
	validates :price, presence: true
	validates :description, presence: true
	validates :active, presence: true

	has_many :songs, dependent: :destroy
	has_many :item_genres, dependent: :destroy
	has_many :item_singers, dependent: :destroy
	has_many :item_carts, dependent: :destroy
	has_many :stocks, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	belong_to :label
end
