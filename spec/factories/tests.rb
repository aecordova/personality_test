require 'faker'

FactoryBot.define do
  factory :test do
    title { Faker::Lorem.sentence }
    author { create(:admin_user) }
    audience { :open }
    status { :published }
    questions { create_list(:question, 3) }

    trait :draft do
      status { :draft }
    end

    trait :archived do
      status { :archived }
    end

    trait :closed do
      audience { :closed }
    end

    factory :draft_test, traits: [:draft]
    factory :archived_test, traits: [:archived]
    factory :published_test, traits: []
  end
end
