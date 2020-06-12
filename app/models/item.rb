class Item < ApplicationRecord
  belongs_to_active_hash :delivery
  belongs_to :user,required: false
  belongs_to :category,required: false
  belongs_to :brand,required: false
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
