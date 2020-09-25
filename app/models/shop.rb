class Shop < ApplicationRecord

  has_many :delivery_dates
  has_many :items, through: :delivery_dates


end
