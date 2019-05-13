class Review < ApplicationRecord
	# フォームを保存する際に以下のバリデーションを設定している
	validates :body, presence: true, length: { in: 1..5000 }

	# アソシエーション設定
	belongs_to :user
	belongs_to :item
end
