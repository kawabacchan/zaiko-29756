class ShopsController < ApplicationController
  before_action :all_shop, only: [:new, :create, :destroy]
  before_action :set_shop, only: [:edit, :update]
  before_action :set_company, only: [:index, :new, :create, :edit, :update, :destroy, :import, :receive]

  def index
    @shops = Shop.where(company_id: params[:company_id]).order(company_id: 'ASC')
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to new_company_shop_path
    else
      render :new
    end
  end

  def edit
    @shops = Shop.where(company_id: params[:company_id])
  end

  def update
    @shops = Shop.where(company_id: params[:company_id])
    if @shop.update(shop_params)
      redirect_to new_company_shop_path
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.new
    if @shop.destroy
      redirect_to new_company_shop_path
    else
      render :new
    end
  end

  def import
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

  def receive
    @shops = Shop.where(company_id: params[:company_id])
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :prefecture_id, :delivery_days).merge(company_id: params[:company_id])
  end

  def all_shop
    @shops = Shop.all.order(company_id: 'ASC')
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
