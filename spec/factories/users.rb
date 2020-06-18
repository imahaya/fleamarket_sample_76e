FactoryBot.define do

  factory :user do

    name              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    phone_number          {"09012345678"}
    family_name           {"鈴木"}
    first_name            {"太郎"}
    family_name_kana      {"すずき"}
    first_name_kana       {"たろう"}
    birthday { Date.new(2000, 11, 12) }
  end
end