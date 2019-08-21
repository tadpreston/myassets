FactoryBot.define do
  factory :user do
    first_name  { "Bob" }
    last_name   { "Smith" }
    username    { |n| "bobsmith#{n}" }
    email       {|n| "email#{n}@email.com" }
    password    { "supersekrit" }
    password_confirmation { "supersekrit" }
  end
end
