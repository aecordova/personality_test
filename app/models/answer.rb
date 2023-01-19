class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :response
  belongs_to :responder, class_name: "User", foreign_key: "responder_id"

  validates :answer_text, presence: true, if: ->{ question&.text? }
  validates :answer_value, presence: true, if: ->{ question&.multiple_choice? || question&.true_false?  }
end
