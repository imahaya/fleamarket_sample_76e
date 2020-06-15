class PostsController < ApplicationController

  def index
    @parents = Category.all.order("id ASC").limit(20)
  end

  def show
  end
  
end
