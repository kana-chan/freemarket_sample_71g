class ItemsController < ApplicationController
  
  def index
    # @items = Item.find(1)
  end

  def show
  @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.images.new
    @prefecture = Address.where('prefecture_id IN(?)', params[:prefecture_id])
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
  end

  def update
  end

  def destroy
  end

  def item_params
    params.require(:item).permit(:name, :explaination, :conditon, :date, :responsibility, :price, :prefecture_id, :brand, images_attributes: [:src])
  end

end