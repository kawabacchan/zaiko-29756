class ItemsController < ApplicationController
  before_action :all_item, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @orders = Order.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to new_item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to new_item_path
    else
      render :new
    end
  end

  def import
    Item.import(params[:file])
    redirect_to new_item_path
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :code, :name, :stock, :monthly_sales)
  end

  def all_item
    @items = Item.all.order(code: "ASC")
  end

  def set_item
    @item = Item.find(params[:id])
  end

end