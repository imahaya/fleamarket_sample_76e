class Item < ApplicationRecord
  belongs_to :user,required: false
  belongs_to :category,required: false
  belongs_to :brand,required: false
  has_many :images
  accepts_nested_attributes_for :images
end
