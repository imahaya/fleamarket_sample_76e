class Address < ApplicationRecord
  # belongs_to :user
  # belongs_to :seller
  # belongs_to :buyer

  validates :shopping_family_name, presence: true
  validates :shopping_first_name, presence: true
  validates :shopping_family_name_kana, presence: true
  validates :shopping_first_name_kana, presence: true
  validates :post_code, presence: true
  validates :prefecture_code, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :buildingname, presence: true
  validates :phone_number, presence: true
end
