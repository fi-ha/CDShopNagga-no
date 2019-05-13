class Item < ApplicationRecord
	validates :item_name, presence: true
	validates :image_id, presence: true
	validates :price, presence: true
	validates :description, presence: true
	validates :active, presence: true
end
