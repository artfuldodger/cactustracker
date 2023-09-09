FactoryBot.define do
  factory :measurement do
    association :plant
    date { "2023-09-09" }
    size { 1.5 }
    unit { "MyString" }
  end
end
