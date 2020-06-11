class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  
  def new
    @item = Item.new
    @item.images.new
  end

  def create
    # Item.create(item_params)
    
    # redirect_to root_path

    @item = Item.create(item_params)
    if @item.save!
    redirect_to root_path
    else 
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:introduction,:category_id, :consignor_area, :days, :delivery_fee, :condition, :user_id, :brand_id, :price, images_attributes: [:image, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
