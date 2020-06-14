class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :prefecture

  belongs_to :user
  belongs_to :seller, optional: true
  belongs_to :buyer, optional: true

  validates :shopping_family_name, :shopping_first_name, :shopping_family_name_kana, :shopping_first_name_kana, :post_code, :prefecture_code, :city, :address, :buildingname, :phone_number,presence: true

end
