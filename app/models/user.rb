# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string
#  email           :string
#  role            :integer          default("guest")
#  password_digest :string
#
class User < ApplicationRecord
  has_secure_password(validations: false)
  
  has_many :responses, dependent: :destroy
  has_many :results, through: :responses
  has_many :answers, through: :responses
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :responded_tests, through: :responses, source: :test

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },  unless: ->{ guest? } 
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }, unless: ->{ guest? }
  
  enum role: { guest: 0, user: 1,  admin: 2 }
end
