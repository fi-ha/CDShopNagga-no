class Song < ApplicationRecord

	# フォームを保存する際に以下のバリデーションを設定している
	validates :song_name, presence: true
	validates :number, presence: true

	# アソシエーション設定
	belongs_to :item
end
