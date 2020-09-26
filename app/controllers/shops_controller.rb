class ShopsController < ApplicationController

  before_action :all_shop, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_shop, only: [:edit, :update, :destroy]

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
