class Contact < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :last_name, length:{in: 1..20}
    validates :first_name,length:{in: 1..20}
    validates :email,     length:{in: 1..254}, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :subject,   length:{in: 1..60}
    validates :body,      length:{in: 1..5000},presence: true

    belongs_to :user,  optional: true
    has_one :respon
end
