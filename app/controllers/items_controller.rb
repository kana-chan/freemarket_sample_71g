class ItemsController < ApplicationController
  # before_action :set_image 
  
  def index
    @items = Item.all.includes(:images).order("created_at DESC").page(params[:page]).per(3)
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
  end

  def update
  end

  def destroy
   @item = Item.find(params[:id]) 
   @item.destroy
   redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:name, :explaination, :conditon, :date, :shipping_method, :cost, :responsibility, :price, images_attributes: [:src])
  end

  # def set_image
  #   @images = Image.all
  # end
end