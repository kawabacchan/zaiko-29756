class ShopsController < ApplicationController

  before_action :all_shop, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_shop, only: [:edit, :update, :destroy]

  def index
    @shops = Shop.where(company_id: params[:company_id]).order(company_id: "ASC")
    @company = Company.find(params[:company_id])
  end



  def new
    @shop = Shop.new
    @company = Company.find(params[:company_id])
  end

  def create
    @shop = Shop.new(shop_params)
    @company = Company.find(params[:company_id])
    if @shop.save
      redirect_to new_company_shop_path
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
  end

  def update
    @company = Company.find(params[:company_id])
    if @shop.update(shop_params)
      redirect_to new_company_shop_path
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    if @shop.destroy
      redirect_to new_company_shop_path
    else
      render :new
    end
  end

  def import
    @company = Company.find(params[:company_id])
    if params[:file].present?
      xlsx = Roo::Excelx.new(params[:file].path)
      xlsx.each_row_streaming(offset: 1, pad_cells: true) do |row|
        if Prefecture.pluck(:name).include?(row[1].value)
          if Shop.where(name: row[0].value).present?
            Shop.where(name: row[0].value).update(prefecture_id: Prefecture.find_by(name: row[1].value).id, delivery_days: row[2].value, company_id: @company.id)
          else
            shop = Shop.new(name: row[0].value, prefecture_id: Prefecture.find_by(name: row[1].value).id, delivery_days: row[2].value, company_id: @company.id)
            shop.save
          end
        end
      end
      redirect_to new_company_shop_path
    else
      redirect_to new_company_shop_path
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :prefecture_id, :delivery_days).merge(company_id: params[:company_id])
  end

  def all_shop
    @shops = Shop.all.order(company_id: "ASC")
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end
