class ItemsController < ApplicationController
  
  def index
  end

  def show
  @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.images.new
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
    params.require(:item).permit(:name, :explaination, :conditon, :date, :shipping_method, :cost, :responsibility, :price, images_attributes: [:src])
  end

end