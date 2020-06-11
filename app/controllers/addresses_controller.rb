class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    if @address.save!
    redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def address_params
    params.permit(:shopping_family_name, :shopping_first_name, :shopping_family_name_kana, :shopping_first_name_kana, :post_code, :prefecture_code, :city, :address, :phone_number)
  end

end
