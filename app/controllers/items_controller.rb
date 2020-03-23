class ItemsController < ApplicationController
  
  def index
  end

  def show
   @item = Item.find(params[:id])
  end

  def new
  end
  
  def create
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
  end

end