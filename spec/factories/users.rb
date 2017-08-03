FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Smith'
    username 'jsmith'
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
end
