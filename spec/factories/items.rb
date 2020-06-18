FactoryBot.define do

  factory :item do
    user_id          {"1"}
    item_name        {"a"}
    introduction     {"商品の説明です"}
    category_id      {"1"}
    condition        {"新品、未使用"}
    delivery_fee     {"送料込み(出品者負担)"}
    prefecture_id    {"1"}
    day              {"1~2日で発送"}
    price            {"500"}
    after(:create) { |item| build(:images)}
  end
end

# imagesのfactoryをよういする
# chat-spaceの画像投稿のてすとを参考にするFileopenの記述

# 紐づいているモデルにたいして画像を追加しないといけない
# afterbuild、item.images << Factory(:images)