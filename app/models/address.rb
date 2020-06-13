class Address < ApplicationRecord

  belongs_to :user
  belongs_to :seller
  belongs_to :buyer, optional: true

  validates :shopping_family_name, :shopping_first_name, :shopping_family_name_kana, :shopping_first_name_kana, :post_code, :prefecture_code, :city, :address, :buildingname, :phone_number,presence: true

end
