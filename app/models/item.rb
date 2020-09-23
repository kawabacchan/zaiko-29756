class Item < ApplicationRecord

  validates :category, presence: true
  validates :code, presence: true, uniqueness: true, format: { with: /\A[A-Z]{1}\d{3}\z/}
  validates :name, presence: true, uniqueness:true
  
  with_options presence: true, numericality: {greater_than_or_equal_to: 0} do
    validates :stock, :monthly_sales, :creation_days
  end

end