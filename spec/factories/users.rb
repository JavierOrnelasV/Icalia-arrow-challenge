FactoryBot.define do
  factory :user do
    sequence(:email) {  |n| "test_user#{n}@mail.com" }
    password { "12345678"} 
    password_confirmation { "12345678" }
    sequence(:name) {  |n| "user_#{n}" }
    created_at { Date.today }
  end
  
  factory :creator, class: 'user' do
    sequence(:email) {  |n| "creator_#{n}@mail.com" }
    password { "12345678"} 
    password_confirmation { "12345678" }
    sequence(:name) {  |n| "creator_#{n}" }
    created_at { Date.today }
  end
  
  factory :destination, class: 'user' do
    sequence(:email) {  |n| "destination_#{n}@mail.com" }
    password { "12345678"} 
    password_confirmation { "12345678" }
    sequence(:name) {  |n| "destination_#{n}" }
    created_at { Date.today }
  end
end
