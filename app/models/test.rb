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
class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :responses, dependent: :destroy
  has_many :responders, through: :responses, source: :responder
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :author_id }, if: ->{ open? } 
  
  # cant use public/private because they are reserved words
  enum audience: { open: 0, closed: 1 } 
  enum status: { draft: 0, published: 1, archived: 2 }
  
  def calculation_class
    "Calculations::#{calculation_type.to_s.camelize}".constantize
  end

  alias :calculation :calculation_class
end
