class ItemSinger < ApplicationRecord
	belongs_to :singer
	belongs_to :item
end
