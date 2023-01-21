# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  title          :string
#  caption        :string
#  test_id        :integer
#  question_type  :integer          default("multiple_choice")
#  question_order :integer          default(0)
#  settings       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'faker'

FactoryBot.define do
  factory :question do
    title { Faker::Lorem.sentence }
    caption { Faker::Lorem.sentence }
    test { create(:test) }
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

    factory :text_question, traits: [:text]
    factory :multiple_choice_question, traits: [:multiple_choice]
    factory :true_false_question, traits: [:true_false]
  end
end
