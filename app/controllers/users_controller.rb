class UsersController < ApplicationController
  require 'payjp'

  def pay
    Payjp.api_key = "sk_test_6d6a0e9384940def850311dd"
    Payjp::Charge.create(
      amount: 1100, # 決済する値段
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
