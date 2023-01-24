# == Schema Information
#
# Table name: responses
#
#  id           :bigint           not null, primary key
#  responder_id :bigint           not null
#  test_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :response do
    responder { create(:user) }
    test { create(:test) }
  end
end
