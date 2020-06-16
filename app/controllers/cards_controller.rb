class CardsController < ApplicationController

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to mypages_path(current_user.id) if card.exists?
  end

  def pay #payjpとCardのデータベース作成
    Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
    #保管した顧客IDでpayjpから情報取得
    if params['payjp-token'].blank?
      redirect_to new_card_path
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to new_card_path(current_user.id)
      else
        redirect_to mypages_path
      end
    end
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: currentuser.id}
    )
    @card = Card.new(
      card_id: customer.default_card,
      customer_id: customer.id,
      user_id: current_user.id
    )
    @card.save!
  end

  def destroy #PayjpとCardデータベースを削除
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to new_card_path
  end

  def show #Cardのデータpayjpに送り情報を取り出す
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_card_path 
    else
      Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
