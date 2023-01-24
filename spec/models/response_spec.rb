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
require 'rails_helper'

RSpec.describe Response, type: :model do
  describe 'associations' do
    let(:response) { create(:response) }

    it { response.should belong_to(:test) }
    it { response.should belong_to(:responder).class_name('User').with_foreign_key('responder_id') }

    it { response.should have_many(:answers).dependent(:destroy) }
    it { response.should have_many(:questions).through(:answers) }
  end
end
