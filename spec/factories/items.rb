FactoryBot.define do
  factory :item do
    category_id {Faker::Number.between(from: 2, to: 7)}
    code {Faker::Internet.password(max_length: 8, mix_case: true)}
    name {Faker::Name.first_name}
    stock {Faker::Number.between(from: 0, to: 9999)}
    monthly_sales {Faker::Number.between(from: 0, to: 9999)}
  end
end
