class Respon < ApplicationRecord
  validates :respon_name, presence: true, length:{in: 1..60}
  validates :subject, presence: true, length:{in: 1..60}
  validates :body, presence: true, length:{in: 1..5000}

# rails5ではbelogs_toがデフォルトでnillを許さないようになっているoptional: trueを指定することで許可出来る
  belongs_to :contact
end
