class FormatsController < ApplicationController
  def index
    @formats = User.includes(:address)
  end

  def new
    @format = UserAddress.new
  end

  def create
    @format = UserAddress.new(format_params)
    @format.save
    redirect_to root_path
  end

  private

    def format_params
      params.require(:user_address).permit(:name, :name_kana, :nickname, :postal_code, :prefecture_id, :city, :house_number, :building_name)
    end
end
