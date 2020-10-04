class ItemsController < ApplicationController
  before_action :all_item, only: [:index, :new, :create, :edit, :update, :destroy, :compare]
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @orders = Order.all.order(created_at: "DESC")
    @few_items = []
    @less_items = []
    @items.each do |item|
      if item.stock <= (item.monthly_sales * 0.1)+ 3
        @few_items << item
      elsif item.stock <= item.monthly_sales * 0.5
        @less_items << item
      end
    end
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
      xlsx = Roo::Excelx.new(params[:file].path)
      xlsx.each_row_streaming(offset: 1) do |row|
        if Category.pluck(:name).include?(row[0].value)
          if Item.where(code: row[1].value).present?
            Item.where(code: row[1].value).update(category_id: Category.find_by(name: row[0].value).id, name: row[2].value, stock: row[3].value, monthly_sales: row[4].value)
          else
            item = Item.new(category_id: Category.find_by(name: row[0].value).id, code: row[1].value, name: row[2].value, stock: row[3].value, monthly_sales: row[4].value)
            item.save
          end
        end
      end
      redirect_to new_item_path
    else
      render :new
    end
  end
    
  def compare
    if params[:file].present?
      @error_stock_items = []
      xlsx = Roo::Excelx.new(params[:file].path)
      xlsx.each_row_streaming(offset: 1, pad_cells: true) do |row|
        unless Item.where(code: row[1].value).present? && (Item.find_by(code: row[1].value).stock == row[3].value)
          item = Item.new(category_id: row[0].value, code: row[1].value, name: row[2].value, stock: row[3].value, monthly_sales: row[4].value)
          @error_stock_items << item
        end
      end
      Item.all.each do |item|
        unless xlsx.column(2).include?(item.code)
          item = Item.new(category_id: item.category_id, code: item.code, name: item.name, stock: "", monthly_sales: "")
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