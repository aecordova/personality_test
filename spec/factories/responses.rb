FactoryBot.define do
  factory :response do
    responder { create(:user) }
    test { create(:test) }
  end
end
