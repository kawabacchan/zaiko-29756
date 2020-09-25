class Company < ApplicationRecord

  has_many :shops

  validates :name, presence: true
end
