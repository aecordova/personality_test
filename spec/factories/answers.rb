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
