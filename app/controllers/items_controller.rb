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
    category_params
    if @item.save
      redirect_to root_path
    else
      redirect_to action: :new
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

  def category_params
    params.require(:item).permit(@category_grandchildren = Category.find("#{params[:child_id]}").children)
  end
end