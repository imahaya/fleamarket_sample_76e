class PostsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC").limit(3)
  end

  def new

  end

  def create

  end

  def show
    @item = Item.find(params[:id])
  end


  def post_params
    params.require(:images).permit(:imgge)
    params.require(:items).permit(:item_name, :price)
  end
  
end