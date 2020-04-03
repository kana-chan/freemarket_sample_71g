class CardsController < ApplicationController
  require 'payjp'
  

  
  def index
  end

  
  def new
    if @card
      redirect_to cards_path unless @card
    else
      
    end
  end

  
  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
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

  
  def destroy
  end

  
end