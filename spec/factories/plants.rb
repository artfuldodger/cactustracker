FactoryBot.define do
  factory :plant do
    association :user
    nickname { 'Berty the Bridgesii' }
    variety { 'Bridgesii' }
    description { 'What a beaut!' }
  end
end
