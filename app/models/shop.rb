class Shop < ApplicationRecord
  belongs_to :company
  has_many :orders
  has_many :items, through: :orders

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, presence:true
  validates :prefecture, presence:true
  validates :delivery_days, presence:true, numericality: {greater_than: 0}
  validates :prefecture_id, numericality: {other_than: 1}

end
