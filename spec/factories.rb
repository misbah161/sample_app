FactoryGirl.define do
  factory :user do |user|
    user.name                  "Example User"
    user.email                 "user@example.com"
    user.password              "welcome"
    user.password_confirmation "welcome"
  end
end