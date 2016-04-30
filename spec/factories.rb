FactoryGirl.define do
  factory :user do
    first_name "Joe"
    last_name "Schmoe"
    username "JoeSchmoe"
    email "joe@example.com"
    password "password"
  end
end
