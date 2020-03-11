FactoryBot.define do
  factory :user do
    sequence(:email) {  |n| "test_user#{n}@mail.com" }
    password { "12345678"} 
    password_confirmation { "12345678" }
    name { "user name"} 
    created_at { Date.today }
  end
end
