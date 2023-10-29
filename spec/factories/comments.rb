FactoryBot.define do
  factory :comment do
    user { nil }
    commentable { nil }
    text { "MyText" }
  end
end
