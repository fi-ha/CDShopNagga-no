class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :carts
         has_many :contacts
         has_many :reviews, dependent: :destroy
         has_many :favorites, dependent: :destroy

         validates :last_name, presence: true, length: {minimum: 1, maximum: 20}
         validates :first_name, presence: true, length: {minimum: 1, maximum: 20}
         validates :last_name_kana, presence: true, length: {minimum: 1, maximum: 20}
         validates :first_name_kana, presence: true, length: {minimum: 1, maximum: 20}
         validates :postal_code, presence: true, length: {maximum: 7}
         validates :phone_number, presence: true, length: {minimum: 1 , maximum: 15}
         validates :encrypted_password, presence: true, length: {minimum: 6}

         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}, length: {maximum: 254}





end
