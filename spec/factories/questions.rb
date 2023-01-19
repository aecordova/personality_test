require 'faker'

FactoryBot.define do
  factory :question do
    title { Faker::Lorem.sentence }
    caption { Faker::Lorem.sentence }
    author { create(:admin_user) }
    test { create(:test, author: author) }
    question_type { :multiple_choice }
    question_order { 1 }

    trait :text do
      question_type { :text }
      settings { nil }
    end

    trait :multiple_choice do
      question_type { :multiple_choice }
      settings { {choices: [{order: 0, caption: "Option 1", value: 1}, {order: 1, caption: "Option 2", value: 2}]} }
    end

    trait :true_false do
      question_type { :true_false }
      settings { {choices: [{order: 0, caption: "True", value: 1}, {order: 1, caption: "False", value: 0}]} }
    end
  end
end
