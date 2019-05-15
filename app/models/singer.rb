class Singer < ApplicationRecord

	has_many :item_singers

    validates :singer_name, uniqueness: true

end
