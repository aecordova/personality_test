# == Schema Information
#
# Table name: answers
#
#  id           :bigint           not null, primary key
#  answer_text  :string
#  answer_value :integer
#  question_id  :bigint           not null
#  response_id  :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :answer do
    response { create(:response) }
    question { create(:question, test: response.test) }
    responder { response.responder }

    trait :text do
      question { create(:question, :text, test: response.test) }
      answer_text { Faker::Lorem.sentence }
    end

    trait :multiple_choice do
      question { create(:question, :multiple_choice, test: response.test) }
      answer_value { question.choices.first[:value] }
    end

    trait :true_false do
      question { create(:question, :true_false, test: response.test) }
      answer_value { question.choices.first[:value] }
    end
  end
end
