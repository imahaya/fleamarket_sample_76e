require 'rails_helper'

describe Item do
  it "item_nameが空だと出品不可" do
    item = build(:item, item_name: "")
    item.valid?
    expect(item.errors[:item_name]).to include("を入力してください")
  end
  it "introductionが空では出品不可" do
    item = build(:item, introduction: "")
    item.valid?
    expect(item.errors[:introduction]).to include("を入力してください")
  end
  it "category_idが空では出品不可" do
    item = build(:item, category_id: "")
    item.valid?
    expect(item.errors[:category_id]).to include("を入力してください")
  end
  it "conditionが空では出品不可" do
    item = build(:item, condition: "")
    item.valid?
    expect(item.errors[:condition]).to include("を入力してください")
  end
  it "delivery_feeが空では出品不可" do
    item = build(:item, delivery_fee: "")
    item.valid?
    expect(item.errors[:delivery_fee]).to include("を入力してください")
  end
  it "prefecture_idが空では出品不可" do
    item = build(:item, prefecture_id: "")
    item.valid?
    expect(item.errors[:prefecture_id]).to include("を入力してください")
  end
  it "dayが空では出品不可" do
    item = build(:item, day: "")
    item.valid?
    expect(item.errors[:day]).to include("を入力してください")
  end
  it "priceが空では出品不可" do
    item = build(:item, price: "")
    item.valid?
    expect(item.errors[:price]).to include("を入力してください")
  end
  it "imagesが空では出品不可" do
    item = build(:item)
    item.images = []
    item.valid?
    expect(item.errors[:images]).to include("を入力してください")
  end
end