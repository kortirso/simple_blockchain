FactoryBot.define do
  factory :doctor do
    profession 'Алхимик'
    hospital 'Лаборатория'
    association :user
  end
end
