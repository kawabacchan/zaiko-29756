class OrdersController < ApplicationController

  before_action :all_item, only: [:new, :create]
  before_action :set_shop, only: [:new, :create]

  def index
    @orders = Order.all.order(created_at: "DESC")
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @item = Item.find(@order.item_id)
    if @item.update(stock: (@item.stock - @order.sales_numbers)) && @order.save
      redirect_to new_company_shop_order_path
    else
      render :new
    end
  end

  def destroy
    @order = Order.find(params[:id])
    item = Item.find(@order.item_id)
    if @order.destroy
      redirect_to company_shop_orders_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order).permit(:sales_numbers, :item_id).merge(shop_id: params[:shop_id])
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def all_item
    @items = Item.all.order(code: "ASC")
  end

end

