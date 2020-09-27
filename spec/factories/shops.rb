FactoryBot.define do
  factory :shop do

    name {Faker::Name.name}
    prefecture_id {Faker::Number.between(from:1, to:10)}
    delivery_days {Faker::Number.between(from:1, to:10)}
    association :company

  end
end
