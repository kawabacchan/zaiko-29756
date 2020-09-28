class Order < ApplicationRecord

  belongs_to :item
  belongs_to :shop

  validates :sales_numbers, presence: true, numericality: {greater_than: 0}

  def sum
    self.each do |order|
      sum += order.sales_numbers
    end
    puts sum 
  end

end
