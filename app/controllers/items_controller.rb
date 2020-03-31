class ItemsController < ApplicationController
before_action :set_item, only: [:show, :edit, :update]
  def set_item
    @item = Item.find(params[:id])
  end


  def index
    @items = Item.all.includes(:images).order("created_at DESC").page(params[:page]).per(3)
  end

  def show
  end

  def new
    @item = Item.new
    5.times { @item.images.build }
    @prefecture = Address.where('prefecture_id IN(?)', params[:prefecture_id])
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  
  def create
    @item = Item.new(item_params)
    category_id_params
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
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
    if @item.destroy
      redirect_to root_path
    else 
      redirect_to item_path(item_id)
    end
  end

  private

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
      :category_id,
      images_attributes: [:src]
    ).merge(
      user_id: current_user.id
    )
  end


  # def category_id_params
  #   { category_id: params[:category_id]}
  # end
  def category_id_params
    category = params.permit(:category_id)
    @item[:category_id] = category[:category_id]
  end
end