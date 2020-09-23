class Item < ApplicationRecord

  validates :category, presence: true
  validates :name, presence: true, uniqueness:true
  validates :code, presence: true, uniqueness: true, format: { with: /\A[A-Z]{1}\d{3}\z/, message: "半角英字1文字と半角数字3桁を入力してください"}
  
  with_options presence: true, numericality: {greater_than_or_equal_to: 0} do
    validates :stock, :monthly_sales, :creation_days
  end

end