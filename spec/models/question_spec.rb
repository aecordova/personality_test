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
require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { build(:question) }
  describe 'validations' do
    it { question.should validate_presence_of(:caption) }
  end

  describe 'associations' do
    it { question.should belong_to(:test) }
  end

  describe "true_false question type" do
    let(:question) { build(:question, question_type: :true_false, choices: ["bleep"]) }
    
    it "should set choices to true/false" do
      question.save
      
      expect(question.choices).to match [
        {order: 0, caption: "True", value: true}, {order: 1, caption: "False",value: false}
      ]
    end
  end
end
