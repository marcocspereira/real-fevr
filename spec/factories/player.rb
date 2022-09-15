FactoryBot.define do
  factory :player do
    name { Faker::Name.unique.name }
    birthdate { Faker::Date.birthday(min_age: 15, max_age: 95) }
    nationality {Faker::Name.unique.name }
    position { Player::POSITIONS.sample }
    sequence(:number) { |n| n }
  end

end