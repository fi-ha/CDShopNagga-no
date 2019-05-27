class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # 論理削除用記述
         acts_as_paranoid

         has_many :carts
         has_many :contacts
         has_many :reviews, dependent: :destroy
         has_many :favorites, dependent: :destroy

         validates :last_name, presence: true, format: {with: /^[一-龥ぁ-ん]/, :multiline => true }, length: {minimum: 1, maximum: 20}
         validates :first_name, presence: true, format: {with: /^[一-龥ぁ-ん]/, :multiline => true }, length: {minimum: 1, maximum: 20}
         validates :last_name_kana, presence: true, format: {with: /^[ァ-ンー－]+$/, :multiline => true }, length: {minimum: 1, maximum: 20}
         validates :first_name_kana, presence: true, format: {with: /^[ァ-ンー－]+$/, :multiline => true  }, length: {minimum: 1, maximum: 20}
         validates :postal_code, presence: true, format: {with: /^\d{7}$/, :multiline => true }, length: {maximum: 7}
         validates :addres, presence: true, length: {minimum: 1, maximum: 300}
         validates :phone_number, presence: true, length: {maximum: 15}


         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}, length: {maximum: 254}





end
