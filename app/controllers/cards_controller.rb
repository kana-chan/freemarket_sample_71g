class CardsController < ApplicationController
  require 'payjp'
  

  # 後ほど登録したクレジットの表示画面を作成します。
  def index
  end

  # クレジットカード情報入力画面
  def new
    if @card
      redirect_to cards_path unless @card
    else
      redirect_to root_path
    end
  end

  # 登録画面で入力した情報をDBに保存
  def create
    Payjp.api_key = "sk_test_a61f106182797a9972516b52"
    if params['payjp-token'].blank?
      redirect_to root_path
    else
      customer = Payjp::Customer.create( # ここで先ほど生成したトークンを顧客情報と紐付け、PAY.JP管理サイトに送信
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id} # 記述しなくても大丈夫です
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to cards_path
      else
        redirect_to root_path
      end
    end
  end

  # 後ほど削除機能を実装します。
  def destroy
  end

  
end