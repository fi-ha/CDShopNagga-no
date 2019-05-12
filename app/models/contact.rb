class Contact < ApplicationRecord
    validates :last_name, length:{in: 1..20}
    validates :first_name, length:{in: 1..20}
    validates :email, presence: true, length:{in: 1..254}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i　format: { with: VALID_EMAIL_REGEX }
    validates :subject, length:{in: 1..60}
    validates :body, presence: true, length:{1..5000}
end
