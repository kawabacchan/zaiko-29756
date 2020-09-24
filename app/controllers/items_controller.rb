class ItemsController < ApplicationController
  def index
    @items = Item.all.order(code: "ASC")
  end

  def new
    @item = Item.new
    @items = Item.all.order(code: "ASC")
  end

  def create
    @items = Item.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :code, :name, :stock, :monthly_sales, :creation_days)
  end

end