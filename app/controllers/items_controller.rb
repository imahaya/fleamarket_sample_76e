class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :search]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  before_action :set_parents, only: [:new, :create,:edit, :update]

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def show
    @item.prefecture
    @item = Item.find(params[:id])
    @grandchild = Category.find(@item.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
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
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @parents_category = Category.where(ancestry: nil)
    # 親セレクトボックスの初期値(配列)
    @parents_array = []
    # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
      
    @parents_array << @parents_category.pluck(:name)

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
      render :show
    end

  end


  private

  def item_params
    params.require(:item).permit(:item_name,:introduction,:category_id,:prefecture_id, :day, :delivery_fee, :condition, :user_id, :brand, :price, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end
end