class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]


  def index
    redirect_to new_item_path
  end

  def show
    @item = Item.find(params[:id])
    @prefecture = Prefecture.find(@item.prefecture_id)
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
      render "new"
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to items_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:introduction,:category, :prefecture_id, :day, :delivery_fee, :condition, :user_id, :brand, :price, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
