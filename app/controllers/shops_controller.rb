class ShopsController < ApplicationController

  def index
    @shops = Shop.all.order(name: "ASC")
  end

  def new
    @shops = Shop.all.order(name: "ASC")
    @shop = Shop.new
  end

  def create
    @shops = Shop.all.order(name: "ASC") 
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
    params.require(:shop).permit(:name, :prefecture_id, :delivery_days).merge(company_id: params[id])
  end

end
