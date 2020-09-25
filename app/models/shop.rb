class Shop < ApplicationRecord

  has_many :delivery_dates
  has_many :items, through: :delivery_dates

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :company_name, presence:true
  validates :shop_name, presence:true
  validates :prefecture, presence:true
  validates :delivery_days, presence:true, numericality: {other_than: 0}
  validates :prefecture_id, numericality: {other_than: 1}


end
