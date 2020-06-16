class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :search]
  before_action :set_parents, only: [:new, :create]


  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def search
    #ajax通信を開始
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandChilds = Category.find(params[:children_id]).children
        end
      end
    end
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    # Item.create(item_params)
    
    # redirect_to root_path

    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else 
      redirect_to root_path
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