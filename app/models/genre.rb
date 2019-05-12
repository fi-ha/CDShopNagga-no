class Genre < ApplicationRecord
  # フォームを保存する際に以下のバリデーションを設定している
  validates :name,
    presence: true, # 空では無い
    uniqueness: true # 他と同じでは無い

end
