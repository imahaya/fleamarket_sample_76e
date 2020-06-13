class User < ApplicationRecord
  # # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :birthday, :phone_number, :encrypted_password, presence: true

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :family_name, presence: true, format: { with: /\A[一-龥]+\z/}
  validates :first_name, presence: true, format: { with: /\A[一-龥]+\z/}
  validates :family_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/}

  has_many :items
  has_many :cards
  has_many :sellers
  has_many :buyers
  has_one :address
end
