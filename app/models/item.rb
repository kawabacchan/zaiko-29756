class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :category, presence: true
  validates :category_id, numericality: {other_than: 1}
  validates :code, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\A[A-Z]{1}\d{3}\z/}
  validates :name, presence: true, uniqueness: { case_sensitive: true }
  
  with_options presence: true, numericality: {greater_than_or_equal_to: 0} do
    validates :stock, :monthly_sales, :creation_days
  end

end