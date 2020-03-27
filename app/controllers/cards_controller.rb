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
      amount: 3000,
      customer: @card.customer_id,
      currency: 'jpy',
    )
  redirect_to action: 'done' 
  end

  def create
    Payjp.api_key = 'sk_test_6d6a0e9384940def850311dd'
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @payment = Payment.new(user_id: current_user.id, customer_id: customer.id, card_token: params[:payjpToken])
    if  payment.save
      redirect_to root_path
    else
      redirect_to pay_path
    end
  end
  
  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
end