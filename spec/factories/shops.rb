FactoryBot.define do
  factory :shop do

    name {Faker::Name.first_name}
    prefecture_id {Faker::Number.between(from:2, to:48)}
    delivery_days {Faker::Number.between(from:1, to:99)}
    association :company

  end
end
