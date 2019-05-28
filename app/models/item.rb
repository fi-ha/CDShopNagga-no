class Item < ApplicationRecord
	# フォームを保存する際に以下のバリデーションを設定している
	validates :item_name, presence: true
	validates :price, presence: true


	# アソシエーション設定
	has_many :songs,      dependent: :destroy
	has_many :item_genres,dependent: :destroy
	# itemから中間テーブル(item_genre)を経由して、item_idに対応したgenreのカラムを呼び出す為。多対多のときにhas_many throughを使う。
	has_many :genres, through: :item_genres
	has_many :item_singers, dependent: :destroy
	has_many :singers, through: :item_singers
	has_many :item_carts, dependent: :destroy
	has_one :stock, dependent: :destroy

	# fields_forでネストする子モデルを指定
	# allow_destroyはcocoonのフォーム削除に関連
	accepts_nested_attributes_for :item_singers, :item_genres, :stock
	accepts_nested_attributes_for :songs, allow_destroy: true

	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	belongs_to :label


 #販売中、販売停止切り替え用
	enum active: { 販売中: 1, 販売停止: 2 }

	#画像
	attachment :image

	# 中間テーブルfavoritesにおいて、ユーザーidに基づくitemsが存在するかどうかの判別式を定義
	# http://railsdoc.com/references/where
	# http://railsdoc.com/references/exists%3F

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

    def self.search(search)
        if search
            Item.where(['item_name LIKE ?', "%#{search}%"])
        else
            Item.all
        end
    end

 #販売中、販売停止切り替え用
	def toggle_status!
		if 販売中?
		  販売停止!
		else
		  販売中!
		end
	  end




end
