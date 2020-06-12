class Item < ApplicationRecord
  enum day:{"1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3}
  enum delivery_fee:{"送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}
  enum condition:{"新品、未使用": 1, "未使用に近い": 2,"目立った傷や汚れなし": 3,"やや傷や汚れあ": 4,"傷や汚れあり": 5,"全体的に状態が悪い": 6}

  belongs_to :user,required: false
  belongs_to :category,required: false
  belongs_to :brand,required: false
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
