class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :email,             uniqueness: true
    validates :password,          length: { minimum: 6 , message: "は６文字以上入力してください"} , format: { with: /\A[a-z]+[0-9]+\z/i, message: "は半角アルファベットと数字をそれぞれ１文字以上入力してください"}
    validates :family_name,       format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角ひらがな、全角カタカナ、漢字で入力してください"}
    validates :first_name,        format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角ひらがな、全角カタカナ、漢字で入力してください"}
    validates :family_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してください"}
    validates :first_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してください"}
    validates :birthday
  end
end
