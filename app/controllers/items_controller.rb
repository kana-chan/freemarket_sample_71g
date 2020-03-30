class ItemsController < ApplicationController
before_action :set_item, only: [:show, :edit, :update]
  def set_item
    @item = Item.find(params[:id])
  end


  def index
  end

  def show
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
      render :new
    end
  end

  def edit
  end

  def update
    if @item.save(item_params)
      redirect_to item_path(item_id)
    else 
      redirect_to edit_item_path(item_id)
    end
  end

  def destroy
    @item = Item.find(params[:id]) 
    -if @item.destroy
      redirect_to root_path
    -else 
      redirect_to item_path(item_id)
  end

  def item_params
    params.require(:item).permit(
      :name, 
      :explaination, 
      :price, 
      :brand, 
      :prefecture_id, 
      :condition_id, 
      :shipment_id, 
      :responsibility_id, 
      images_attributes: [:src]
    ).merge(
      user_id: current_user.id
    )
  end

end