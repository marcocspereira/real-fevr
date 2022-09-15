FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password {Faker::Internet.unique.password }
    admin { false }

    trait :is_admin do
      admin { true }
    end
  
    factory :admin, traits: [:is_admin]
    
  end
end