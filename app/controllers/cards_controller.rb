class CardsController < ApplicationController
  before_action :set_card, only: [:new, :destroy, :show]
  before_action :secret_key, only: [:pay, :create, :destroy, :show]
  require 'payjp'

  def new
    if @card.blank?
      @card = Card.new
    else
      redirect_to card_path(current_user)
    end
  end

  def pay #payjpとCardのデータベース作成
    #保管した顧客IDでpayjpから情報取得
    if params['payjp-token'].blank?
      redirect_to action: "new"
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
    customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
    )
    @card = Card.new(
      card_id: customer.default_card,
      customer_id: customer.id,
      user_id: current_user.id
    )
    if @card.save!
      redirect_to root_path
    else
      redirect_to new_card_path
    end
  end

  def destroy #PayjpとCardデータベースを削除

    if @card.blank?
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to new_card_path
  end

  def show #Cardのデータpayjpに送り情報を取り出す
    if @card.blank?
      redirect_to new_card_path 
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  private

  def secret_key
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end
end
