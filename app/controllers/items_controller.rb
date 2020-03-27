class ItemsController < ApplicationController
  
  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    5.times { @item.images.build }
    @prefecture = Address.where('prefecture IN(?)', params[:prefecture])
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    Item.update(item_params)
    redirect_to item_path(item_id)
  end

  def destroy
    @item = Item.find(params[:id]) 
    @item.destroy
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:name, :explaination, :condition_id, :shipment_id, :responsibility_id, :price, :prefecture, :brand, images_attributes: [:src])
  end

end