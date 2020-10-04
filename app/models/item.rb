class Item < ApplicationRecord

  has_many :orders, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :category, presence: true
  validates :category_id, numericality: {other_than: 1}

  validates :code, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\A[a-zA-Z0-9]{1,8}\z/}
  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 10}
  
  with_options presence: true, numericality: {greater_than_or_equal_to: 0, less_than: 10000} do
    validates :stock, :monthly_sales
  end


end