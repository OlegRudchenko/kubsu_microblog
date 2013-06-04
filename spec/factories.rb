FactoryGirl.define do
  factory :user do
    name     "Oleg Rudchenko"
    email    "oleg.rudchenko@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end