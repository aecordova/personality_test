class Question < ApplicationRecord
  belongs_to :test
  validates :caption, presence: true, length: { maximum: 255 }
  before_save :set_true_false_choices, if: ->{ true_false? }

  enum question_type: { multiple_choice: 0, true_false: 1, text: 2 }

  store :settings, accessors: [:choices]

  private

  def set_true_false_choices
    binding.pry
    self.choices = [{order: 0, caption: "True", value: true}, {order: 1, caption: "False",value: false}]
  end
end
