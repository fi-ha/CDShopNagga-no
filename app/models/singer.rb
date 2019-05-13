class Singer < ApplicationRecord

	has_many :item_singers

    varidates :singer_name, uniqueness: true

end
