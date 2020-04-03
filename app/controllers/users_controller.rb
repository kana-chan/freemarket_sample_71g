class UsersController < ApplicationController
  require 'payjp'

  def pay
    Payjp.api_key = "sk_test_6d6a0e9384940def850311dd"
    #@creditcard = Creditcard.where(user_id: current_user.id).first
    @item = Item.find(params[:id])
    Payjp::Charge.create(
      amount: @item.price,
      card: params['payjp-token'], # フォームを送信すると生成されるトークン
      currency: 'jpy'
    )
    redirect_to root_path
  end
  
  
  def show
  end

  def edit
  end
end
