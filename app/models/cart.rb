class Cart < ApplicationRecord
  # アソシエーション設定
  belongs_to :user            # usersモデルにアソシエーション
  has_many   :item_carts      # item_carts中間モデルにアソシエーション
  has_one    :ship_to_another # ship_to_anotherモデルにアソシエーション

  # フォームを入れ子にする場合入れ子にしたフォームを認識させる為に以下が必要
  accepts_nested_attributes_for :item_carts

  # enumでの関連付けをここで宣言することでビューでラベルのみで数字をモデルに入力するすることが出来る
  enum payment: {銀行振込:1, 代金引換:2, クレジットカード:3}
  enum status:  {カート:1, 未発送:2, 発送済み:3}
end
