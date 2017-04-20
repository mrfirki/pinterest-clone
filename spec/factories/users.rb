FactoryGirl.define do
  factory :user do 
    username "arief"
    email { Faker::Internet.email }
    password "123456"
  end

  factory :arief do 
    username "arief"
    email "arief@example.com"
    password "password"
  end

end
