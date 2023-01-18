class Answer < ApplicationRecord
  belongs_to :question, class_name: "Question", foreign_key: "question_id"
  belongs_to :response, class_name: "Response", foreign_key: "response_id"
  belongs_to :responder, class_name: "User", foreign_key: "responder_id"
end
