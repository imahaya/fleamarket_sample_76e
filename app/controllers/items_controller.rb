class ItemsController < ApplicationController

  def new
    @item = Item.new
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

  private
  def item_params
    params.require(:item).permit(:item_name,:introduction)
  end

end
