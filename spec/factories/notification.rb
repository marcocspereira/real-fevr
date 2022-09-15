FactoryBot.define do
  factory :notification do
    player
    sequence(:message) { |n| "Message_#{n}" }
  end
end