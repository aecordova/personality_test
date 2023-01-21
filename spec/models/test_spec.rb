# == Schema Information
#
# Table name: tests
#
#  id         :bigint           not null, primary key
#  title      :string
#  author_id  :string
#  audience   :integer          default("open")
#  status     :integer          default("draft")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Test, type: :model do
  describe 'validations' do
    let(:test) { build(:test) }

    it { test.should validate_presence_of(:title) }
    it { test.should validate_uniqueness_of(:title) }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should have_many(:responses).dependent(:destroy) }
    it { should have_many(:responders).through(:responses).source(:responder) }
    it { should have_many(:questions).dependent(:destroy) }
  end
end
