FactoryBot.define do
  factory :user do
    name 'Именной'
    sequence(:email) { |i| "tester#{i}@gmail.com" }
    password '12345678'
    role 'patient'

    trait :doctor do
      role 'doctor'
    end

    trait :admin do
      role 'admin'
    end
  end
end
