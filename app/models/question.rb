class Question < ApplicationRecord
  belongs_to :test, class_name: "test", foreign_key: "test_id"
  has_many :answers, dependent: :destroy
end
