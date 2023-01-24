# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  title          :string
#  caption        :string
#  test_id        :bigint           not null
#  question_type  :integer          default("multiple_choice")
#  question_order :integer          default(0)
#  settings       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Question < ApplicationRecord
  belongs_to :test
  has_one :author, through: :test

  validates :caption, presence: true, length: { maximum: 255 }
  
  before_save :set_true_false_choices, if: ->{ true_false? }

  enum question_type: { multiple_choice: 0, true_false: 1, text: 2 }

  store :settings, accessors: [:choices]

  private

  def set_true_false_choices
    self.choices = [{order: 0, caption: "True", value: true}, {order: 1, caption: "False",value: false}]
  end
end
