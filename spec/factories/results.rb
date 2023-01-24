# == Schema Information
#
# Table name: results
#
#  id                 :bigint           not null, primary key
#  response_id        :bigint           not null
#  score              :integer          not null
#  max_possible_score :integer          not null
#  question_count     :integer          not null
#  answer_count       :integer          not null
#  result             :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
FactoryBot.define do
  factory :result do
    
  end
end
