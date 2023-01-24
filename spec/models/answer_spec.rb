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
require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'associations' do
    it { should belong_to(:question) }
    it { should belong_to(:response) }
    it { should belong_to(:responder) }
  end

  describe 'validations' do
    let(:multiple_choice_answer) { create(:answer, :multiple_choice) }
    let(:text_answer) { create(:answer, :text) }
    
    it { multiple_choice_answer.should validate_presence_of(:answer_value) }
    it { text_answer.should validate_presence_of(:answer_text) }
  end
end
