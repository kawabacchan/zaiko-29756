FactoryBot.define do
  factory :order do
    sales_numbers {Faker::Number.between(from: 1, to: 9999)}
    association :item
    association :shop
  end
end
