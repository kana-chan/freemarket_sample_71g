class CardsController < ApplicationController
  require 'payjp'
  before_action :set_card, only: [:new, :show, :destroy]
  
  
  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: 'show', id: card if card.exists?
  end

  
  def create
    Payjp.api_key = Rails.application.credentials.payjp[:sk_test]
    if params['payjp-token'].blank?
      redirect_to root_path
    else
      customer = Payjp::Customer.create( 
        email: current_user.email,
        card: params['payjp-token'],
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end

 

  def destroy #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    unless card.blank?
      Payjp.api_key = Rails.application.credentials.payjp[:sk_test]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.payjp[:sk_test]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private

  def set_card
    card = Card.where(user_id: current_user.id).first 
  end
end