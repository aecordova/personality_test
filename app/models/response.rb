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
class Response < ApplicationRecord
  belongs_to :test
  belongs_to :responder, class_name: 'User', foreign_key: 'responder_id'

  has_one :result, dependent: :destroy

  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers
end
