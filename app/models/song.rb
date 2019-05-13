class Song < ApplicationRecord
	validates :song_name, presence: true
	validates :number, presence: true

	belongs_to :item
end
