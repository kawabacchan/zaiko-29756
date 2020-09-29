class OrdersController < ApplicationController

  def index
    @orders = Order.all.order(created_at: "DESC")
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
    item = Item.find(@order.item_id)
    if item.update(stock: (item.stock - @order.sales_numbers))
      if @order.save
        redirect_to new_company_shop_order_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def destroy
    @order = Order.find(params[:id])
    item = Item.find(@order.item_id)
    if @order.destroy
      item.update(stock: (item.stock + @order.sales_numbers))
      redirect_to company_shop_orders_path
    else
      render :index
    end
  end



  private

  def order_params
    params.require(:order).permit(:sales_numbers).merge(shop_id: params[:shop_id], item_id: params[:item_id])
  end

end

