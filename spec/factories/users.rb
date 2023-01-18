require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email(name: name) }
    role { :user }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    trait :guest do
      name { Faker::Name.name }
      email { nil }
      role { :guest }
      password { nil }
      password_confirmation { nil }
    end

    trait :admin do
      role { :admin }
    end

    factory :guest_user, traits: [:guest]
    factory :admin_user, traits: [:admin]
    factory :registered_user, traits: []
  end
end
