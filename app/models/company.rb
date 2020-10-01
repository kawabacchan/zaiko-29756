class Company < ApplicationRecord

  has_many :shops, dependent: :destroy

  validates :name, presence: true

  def self.import(file)
    xlsx = Roo::Excelx.new(file.path)
    xlsx.each_row_streaming(offset: 1, pad_cells: true) do |row|
      company = self.new(name: row[0].value)
      next if self.pluck(:name).include?(company.name)
      company.save
    end
  end

end
