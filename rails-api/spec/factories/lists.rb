FactoryBot.define do
  factory :list do
    name { "学习JavaScript" }
    association :user
  end
end
