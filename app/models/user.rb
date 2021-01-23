class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :prototypes
  has_many :comments

  validates :nickname,         presence: true
  validates :email,            presence: true , unique: true
  validates :password,         presence: true
  validates :family_nama,      presence: true
  validates :first_name,       presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana,  presence: true
  validates :birthday,         presence: true
end
