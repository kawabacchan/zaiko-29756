class Item < ApplicationRecord

  has_many :delivery_dates
  has_many :shops, through: :orders

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :category, presence: true
  validates :category_id, numericality: {other_than: 1}

  validates :code, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\A[A-Z]{1}\d{3}\z/}
  validates :name, presence: true, uniqueness: { case_sensitive: true }
  
  with_options presence: true, numericality: {greater_than_or_equal_to: 0} do
    validates :stock, :monthly_sales
  end

  def self.import(file)
    xlsx = Roo::Excelx.new(file.path)
    xlsx.each_row_streaming(offset: 1) do |row|
      if self.where(code: row[1].value).present?
        self.where(code: row[1].value).update(category_id: row[0].value, name: row[2].value, stock: row[3].value, monthly_sales: row[4].value)
      end
      item = self.new(category_id: row[0].value, code: row[1].value, name: row[2].value, stock: row[3].value, monthly_sales: row[4].value)
      item.save
    end
  end

end