require 'rails_helper'

describe Address do
  describe '#create' do
    it "shopping_family_nameが空だと登録不可" do
      address = build(:address, shopping_family_name: "")
      address.valid?
      expect(address.errors[:shopping_family_name]).to include("を入力してください")
    end
    it "shopping_first_nameが空だと登録不可" do
      address = build(:address, shopping_first_name: "")
      address.valid?
      expect(address.errors[:shopping_first_name]).to include("を入力してください")
    end
    it "shopping_family_name_kanaが空だと登録不可" do
      address = build(:address, shopping_family_name_kana: "")
      address.valid?
      expect(address.errors[:shopping_family_name_kana]).to include("を入力してください")
    end
    it "shopping_first_name_kanaが空だと登録不可" do
      address = build(:address, shopping_first_name_kana: "")
      address.valid?
      expect(address.errors[:shopping_first_name_kana]).to include("を入力してください")
    end
    it "post_codeが空だと登録不可" do
      address = build(:address, post_code: "")
      address.valid?
      expect(address.errors[:post_code]).to include("を入力してください")
    end
    it "cityが空だと登録不可" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end
    it "addressが空だと登録不可" do
      address = build(:address, address: "")
      address.valid?
      expect(address.errors[:address]).to include("を入力してください")
    end
  end
end