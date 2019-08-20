FactoryBot.define do
  factory :user do
    first_name { "Bob" }
    last_name { "Smith" }
    username { "bobsmith" }
    email { "test@email.com" }
    password { "supersekrit" }
    password_confirmation { "supersekrit" }
  end
end
