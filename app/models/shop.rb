class Shop < ApplicationRecord
  belongs_to :company
  has_many :orders, dependent: :destroy
  has_many :items, through: :orders

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, presence: true, length: { maximum: 10}
  validates :prefecture, presence:true
  validates :delivery_days, presence:true, numericality: {greater_than: 0, less_than: 100}
  validates :prefecture_id, numericality: {other_than: 1}

end
