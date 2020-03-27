class CardsController < ApplicationController
  require "payjp"
  before_action :set_card, :set_item
  
  def index
    if @card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = "sk_test_6d6a0e9384940def850311dd"
      @customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
  
  def pay
    Payjp.api_key = "sk_test_6d6a0e9384940def850311dd"
    Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy',
    )
  redirect_to action: 'done' 
  end

  def done
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end