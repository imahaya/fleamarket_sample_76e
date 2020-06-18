require 'rails_helper'

describe User do
  describe '#create' do
    it "nicknameが空だと登録不可" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    it "emailが空だと登録不可" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "emailが@を含まないと登録不可" do
      user = build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email][0]).to include("は不正な値です")
    end
    it "emailの@の前に文字が無いと登録不可" do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("は不正な値です")
    end
    it "emailの@の後に文字が無いと登録不可" do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("は不正な値です")
    end
    it "passwordが空だと登録不可" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "passwordが7文字未満だと登録不可" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password][0]).to include("は7文字以上で入力してください")
    end
    it "password_confirmationが空だと登録不可" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    it "family_nameが空だと登録不可" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end
    it "family_nameに全角以外が含まれると登録不可" do
      user = build(:user, family_name: "AAa")
      user.valid?
      expect(user.errors[:family_name][0]).to include("は不正な値です")
    end
    it "first_nameが空だと登録不可" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "first_nameに全角以外が含まれると登録不可" do
      user = build(:user, first_name: "AAa")
      user.valid?
      expect(user.errors[:first_name][0]).to include("は不正な値です")
    end
    it "family_name_kanaが空だと登録不可" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end
    it "first_name_kanaが空だと登録不可" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    it "phone_numberが空だと登録不可" do
      user = build(:user, phone_number: "")
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください")
    end
    it "すべて満たしていれば登録可" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end