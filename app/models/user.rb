class User < ApplicationRecord
  has_many :responses, dependent: :destroy

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :responded_tests, through: :responses, source: :test

  validates :name, presence: true, uniqueness: true
end
