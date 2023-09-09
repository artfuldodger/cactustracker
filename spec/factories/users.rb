FactoryBot.define do
  factory :user do
    name { 'George' }
    sequence(:email) { |n| "george#{n}@example.com" }
    password { 'C4ctus!?' }
    confirmed_at { Time.now }
  end
end
