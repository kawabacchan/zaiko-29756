class Order < ApplicationRecord

  belongs_to :item
  belongs_to :shop

  validates :sales_numbers, presence: true, numericality: {greater_than: 0}

end
