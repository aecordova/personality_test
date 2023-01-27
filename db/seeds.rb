# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'factory_bot_rails'

QUESTION_LIST =  [
  "How often do you feel comfortable in large groups of people?",
  "How often do you prefer to spend time alone?",
  "How often do you feel drained after social interactions?",
  "How often do you enjoy being the center of attention?",
  "How often do you feel energized by being around people?",
  "How often do you prefer small gatherings over large parties?",
  "How often do you find it easy to start a conversation with a stranger?",
  "How often do you enjoy being alone?",
  "How often do you feel comfortable in unfamiliar social situations?",
  "How often do you need time alone to recharge after spending time with people?",
]

REVERSED_QUESTIONS = [2, 3, 6, 8, 10]

CHOICE_LIST = [
  'Never',
  'Rarely',
  'Sometimes',
  'Often',
  'Always',
]
 
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
puts "\n- Admin User created: #{admin_user.email}"

test = FactoryBot.create(:published_test, 
  author: admin_user, 
  calculation_type: :extrovertion_table_calculation,
  title: 'Quick Personality Test'
)
puts "\n- Test created: #{test.title}, status: #{test.status}, calculation_class: #{test.calculation_class}"
puts "\n- Creating 10 questions..."
QUESTION_LIST.each_with_index do |question_caption, question_index|
  question = FactoryBot.create(:question, :multiple_choice, test: test,  title: nil, caption: question_caption,  settings: { choices: [] })
  puts "\n -> Question created: #{question_index + 1} - #{question_caption}"

  choice_list =  REVERSED_QUESTIONS.include?(question_index + 1) ? CHOICE_LIST.reverse : CHOICE_LIST

  question_choices = choice_list.each_with_index.with_object([]) do |(caption, i), choices|
    choices << { order: i, caption: caption, value: i+1 }
  end
  
  question_choices.reverse! if REVERSED_QUESTIONS.include?(question_index + 1)
  
  question.update(choices: question_choices)
  puts "  -> Choices created: #{question_choices.map{|c| "#{c[:caption]}: #{c[:value]}"}.join(", ") }"
end

puts "\n- Done!! Admin User and Test created with 10 questions"
