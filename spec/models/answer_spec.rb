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
