class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :responses, dependent: :destroy
  has_many :responders, through: :responses, source: :user

  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }

  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }).order(title: :desc) }

  def self.titles_by_category(category)
    by_category(category).pluck(:title)
  end  
end
