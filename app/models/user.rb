class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :purchases

  # VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,100}\z/
  validates :nickname,         presence: true
  validates :email,            presence: true , uniqueness: true
  validates :password,         presence: true , length: { minimum: 6 } , format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6}\z/ , message: "は半角英数字それぞれ１文字以上含む必要があります"}
  validates :family_name,      presence: true 
  validates :first_name,       presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana,  presence: true
  validates :birthday,         presence: true
end
