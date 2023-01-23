# == Schema Information
#
# Table name: answers
#
#  id           :bigint           not null, primary key
#  answer_text  :string
#  answer_value :integer
#  question_id  :integer
#  response_id  :integer
#  responder_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :response

  has_one :responder, through: :response

  validates :answer_text, presence: true, if: ->{ question&.text? }
  validates :answer_value, presence: true, if: ->{ question&.multiple_choice? || question&.true_false?  }
end
