class UsersController < ApplicationController
  require 'payjp'

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
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
