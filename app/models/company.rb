class Company < ApplicationRecord

  has_many :shops, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10}

  def self.import(file)
    xlsx = Roo::Excelx.new(file.path)
    xlsx.each_row_streaming(offset: 1, pad_cells: true) do |row|
      company = self.new(name: row[0].value)
      if row[1].present? && row[2].present? && row[3].present? && Prefecture.where(name: row[2].value).present?
        if self.pluck(:name).include?(company.name)
          if Shop.where(company_id: Company.find_by(name: company.name).id).present?
            if Shop.where(company_id: Company.find_by(name: company.name).id).pluck(:name).include?(row[1].value)
              Shop.where(company_id: Company.find_by(name: company.name).id).find_by(name: row[1].value).update(prefecture_id: Prefecture.find_by(name: row[2].value).id, delivery_days: row[3].value, company_id: Company.find_by(name: company.name).id)
            else
              shop = Shop.new(name: row[1].value, prefecture_id: Prefecture.find_by(name: row[2].value).id, delivery_days: row[3].value, company_id: Company.find_by(name: company.name).id)
              shop.save
            end
          else
            shop = Shop.new(name: row[1].value, prefecture_id: Prefecture.find_by(name: row[2].value).id, delivery_days: row[3].value, company_id: Company.find_by(name: company.name).id)
            shop.save
          end
        else
          company.save
          shop = Shop.new(name: row[1].value, prefecture_id: Prefecture.find_by(name: row[2].value).id, delivery_days: row[3].value, company_id: company.id)
          shop.save
        end
      else
        next if self.pluck(:name).include?(company.name)
        company.save
      end
    end
  end

end
