class ShopsController < ApplicationController

  def index
    @shops = Shop.all.order(shop_code: "ASC")
  end

  def new
    @shops = Shop.all.order(shop_code: "ASC")
    @shop = Shop.new
  end

  def create
    @shops = Shop.all.order(shop_code: "ASC") 
    @shop = Shop.new(params_shop)
    if @shop.save
      redirect_to new_shop_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def params_shop
    params.require(:shop).permit(:company_name, :shop_name, :shop_code, :prefecture_id, :delivery_days)
  end

end
