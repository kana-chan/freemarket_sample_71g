class PurchasesController < ApplicationController
  # def purchase
  #   binding.pry
  #   　#クレジットカードと製品の変数を設定
  #       @creditcard = Creditcard.where(user_id: current_user.id).first
  #       @item = Item.find(params[:id])
  #    #Payjpの秘密鍵を取得
  #       Payjp.api_key= ENV['PAYJP_PRIVATE_KEY']
  #    #payjp経由で支払いを実行
  #       charge = Payjp::Charge.create(
  #         amount: @item.price,
  #         customer: Payjp::Customer.retrieve(@creditcard.customer_id),
  #         currency: 'jpy'
  #       )
  #   　#製品のbuyer_idを付与
  #       # @product_buyer= Item.find(params[:id])
  #       # @product_buyer.update( buyer_id: current_user.id)
  #       redirect_to root_path
  #     end
end
