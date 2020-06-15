class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  

  enum day:{"1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3}
  enum delivery_fee:{"送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}
  enum condition:{"新品、未使用": 1, "未使用に近い": 2,"目立った傷や汚れなし": 3,"やや傷や汚れあり": 4,"傷や汚れあり": 5,"全体的に状態が悪い": 6}
  enum category:{"レディース": 1, "メンズ": 2,"ベビー・キッズ": 3,"インテリア・住まい・小物": 4,"本・音楽・ゲーム": 5,"おもちゃ・ホビー・グッズ": 6,"コスメ・香水・美容": 7,"家電・スマホ・カメラ": 8,"スポーツ・レジャー": 9,"ハンドメイド": 10,"チケット": 11,"自動車・オートバイ": 12,"その他": 13}

  belongs_to :user,required: false
  # belongs_to :category,required: false
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :images, :item_name, :prefecture_id, :price, :day,:delivery_fee, :condition, :category, presence: true

  validates :introduction, presence: true, length: { maximum: 1000 }

end
