class Review < ApplicationRecord
	validates :body, presence: true, length: { in: 1..5000 }
end
