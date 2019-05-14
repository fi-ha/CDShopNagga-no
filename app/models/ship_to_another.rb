class ShipToAnother < ApplicationRecord
	# フォームを保存する際に以下のバリデーションを設定している
	has_one :cart

	# フォームを保存する際に以下のバリデーションを設定している
	validates :first_name,      presence: true, length: {maximum: 20}
	validates :last_name,       presence: true, length: {maximum: 20}
	validates :first_name_kana, presence: true, length: {maximum: 20}
	validates :last_name_kana,  presence: true, length: {maximum: 20}
	validates :postal_code,     presence: true, length: {maximum: 7}
	validates :address,         presence: true, length: {maximum: 300}
end
