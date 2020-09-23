FactoryBot.define do
  factory :item do
    category {"テーブル"}
    code {"A"+ Faker::Number.decimal_part(digits: 3)}
    name {Faker::Lorem.sentence}
    stock {Faker::Number.between(from: 0, to: 1000)}
    monthly_sales {Faker::Number.between(from: 0, to: 1000)}
    creation_days {Faker::Number.between(from: 0, to: 1000)}
  end
end
