# == Schema Information
#
# Table name: tests
#
#  id               :bigint           not null, primary key
#  title            :string
#  author_id        :bigint           not null
#  audience         :integer          default("open")
#  status           :integer          default("draft")
#  calculation_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'faker'

FactoryBot.define do
  factory :test do
    title { Faker::Lorem.sentence }
    author { create(:admin_user) }
    audience { :open }
    status { :published }
    calculation_type { :test_calculation }
    
    trait :draft do
      status { :draft }
    end

    trait :archived do
      status { :archived }
    end

    trait :closed do
      audience { :closed }
    end

    factory :draft_test, traits: [:draft]
    factory :archived_test, traits: [:archived]
    factory :published_test, traits: []
  end
end
