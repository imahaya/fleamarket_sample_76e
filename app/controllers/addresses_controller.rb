class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save!
    redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def address_params
    params.require(:address).permit(:shopping_family_name, :shopping_first_name, :shopping_family_name_kana, :shopping_first_name_kana, :post_code, :prefecture_id, :city, :address, :phone_number,:buildingname).merge(user_id: current_user.id)
  end

end
