class PostsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC").limit(3)
    @images = Image.all.order("created_at DESC").limit(3)
  end

  def new

  end

  def create

  end

  def show
    @item = Item.find(params[:id])
  end
  
end