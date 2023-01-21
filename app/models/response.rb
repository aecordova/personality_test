# == Schema Information
#
# Table name: responses
#
#  id           :bigint           not null, primary key
#  responder_id :integer
#  test_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Response < ApplicationRecord
  belongs_to :test
  belongs_to :responder, class_name: 'User', foreign_key: 'responder_id'

  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers

  accepts_nested_attributes_for :responder, reject_if: ->(attributes){ attributes['name'].blank? }
  accepts_nested_attributes_for :answers
end
