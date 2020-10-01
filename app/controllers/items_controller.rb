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
    if params[:file].present?
      Item.import(params[:file])
      redirect_to new_item_path
    else
      redirect_to new_item_path
    end
  end
    
  def compare
    @items = Item.all
    if params[:file].present?
      @error_stock_items = []
      xlsx = Roo::Excelx.new(params[:file].path)
      xlsx.each_row_streaming(offset: 1, pad_cells: true) do |row|
        unless Item.all.where(code: row[1].value).present? && (Item.all.where(code: row[1].value).first.stock == row[3].value)
          item = Item.new(category_id: row[0].value, code: row[1].value, name: row[2].value, stock: row[3].value, monthly_sales: row[4].value)
          @error_stock_items << item
        end
      end
    else
      redirect_to root_path
    end
    
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