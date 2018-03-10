FactoryBot.define do
  factory :block do
    data 'Genesis block'
    nonce 0
    association :doctor
    association :user
  end
end
