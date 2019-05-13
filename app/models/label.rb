class Label < ApplicationRecord
    validates :label_name, presence: true
    validates :label_name, uniqueness: true

    has_many :items
end
