class Response < ApplicationRecord
    validates :response_name, presence: true, length:{in: 1..60}
    validates :subject, presence: true, length:{in: 1..60}
    validates :body, presence: true, length:{in: 1..5000}

    belongs_to :contact
end
