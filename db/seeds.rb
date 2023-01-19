# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'faker'
require 'factory_bot_rails'

def find_or_create_admin_user
  User.find_by(email: 'angel@email.com') ||
  FactoryBot.create(
    :admin_user, 
    name: 'angel', 
    email: 'angel@email.com', 
    password: '123456', 
    password_confirmation: '123456'
  )
end

admin_user = find_or_create_admin_user
test = FactoryBot.create(:draft_test, author: admin_user)
FactoryBot.create_list(:question, 10, :multiple_choice, test: test)
puts "  -> Done!! Admin User and Test created with 10 questions"
