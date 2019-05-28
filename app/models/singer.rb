class Singer < ApplicationRecord

	has_many :item_singers
	has_many :items, through: :item_singers
    validates :singer_name, uniqueness: true, length: {minimum: 1, maximum: 20}

end
