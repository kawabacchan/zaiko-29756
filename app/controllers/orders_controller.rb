class OrdersController < ApplicationController

  def index
  end

  def new
    @items = Item.all.order(code: "ASC")
    @shop = Shop.find(params[:shop_id])
    @order = Order.new
  end

  def create
  end

end
