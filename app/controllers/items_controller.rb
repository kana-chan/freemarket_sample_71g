class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def show
  @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    5.times { @item.images.build }
    @prefecture = Address.where('prefecture_id IN(?)', params[:prefecture_id])
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      #redirect_to action: :new
      5.times { @item.images.build }
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def item_params
    params.require(:item).permit(:name, :explaination, :condition_id, :shipment_id, :responsibility_id, :price, :prefecture_id, :brand, images_attributes: [:src])
  end

end