class CompaniesController < ApplicationController
  before_action :all_company, only: [:index, :new, :create, :edit, :update, :destroy, :select, :increase, :delivery]
  before_action :set_company, only: [:edit, :update, :destroy]

  def index
    @shops = Shop.includes(:company)
  end

  def new
    @company = Company.new
  end

  def create
    @shops = Shop.includes(:company)
    @company = Company.new(company_params)
    if @company.save
      redirect_to new_company_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to new_company_path
    else
      render :edit
    end
  end

  def destroy
    if @company.destroy
      redirect_to new_company_path
    else
      render :new
    end
  end

  def show
    @items = Item.all.order(code: "ASC")
    @shops = Shop.where(company_id: params[:id])
    @company = Company.find(params[:id])
  end

  def import
    if params[:file].present?
      Company.import(params[:file])
      redirect_to new_company_path
    else
      redirect_to new_company_path
    end
  end

  def select
  end

  def increase
  end

  def delivery
  end


  private

  def company_params
    params.require(:company).permit(:name)
  end

  def all_company
    @companies = Company.all.order(name: "ASC")
  end

  def set_company
    @company = Company.find(params[:id])
  end

end