class ShopsController < ApplicationController

  def index
    @shops = Shop.all.order(shop_code: "ASC")
  end

  def new
    @shops = Shop.all.order(shop_code: "ASC")
    @shop = Shop.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
