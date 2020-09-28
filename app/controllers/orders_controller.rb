class OrdersController < ApplicationController

  def index
    @items = Item.all.order(code: "ASC")
    @shop = Shop.find(params[:shop_id])
  end

  def new
    @items = Item.all.order(code: "ASC")
    @shop = Shop.find(params[:shop_id])
    @order = Order.new
  end

  def create
    @items = Item.all.order(code: "ASC")
    @shop = Shop.find(params[:shop_id])
    @order = Order.new(order_params)
    if @order.save
      redirect_to new_company_shop_order_path
    else
      render :new
    end
  end





  private

  def order_params
    params.require(:order).permit(:sales_numbers).merge(shop_id: params[:shop_id], item_id: params[:item_id])
  end

end
