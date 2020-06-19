require 'rails_helper'

describe Card do
  describe '#create' do
    it "user_idが空だと登録不可" do
      card = build(:card, user_id: "")
      card.valid?
      expect(card.errors[:user_id]).to include("を入力してください")
    end
    it "card_idが空だと登録不可" do
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
    it "customer_idが空だと登録不可" do
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end
  end
end
