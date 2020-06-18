FactoryBot.define do

  factory :address do

    user_id                     {"1"}
    shopping_family_name        {"山本"}
    shopping_first_name         {"太郎"}
    shopping_family_name_kana   {"やまもと"}
    shopping_first_name_kana    {"たろう"}
    post_code                   {"111-1111"}
    prefecture_id               {"1"}
    city                        {"名古屋市中区"}
    address                     {"大須3丁目6-18"}
    phone_number                {"09012345678"}
    buildingname                {"フォンティスビル7階"}
  end
end