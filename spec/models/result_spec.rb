# == Schema Information
#
# Table name: results
#
#  id                 :bigint           not null, primary key
#  response_id        :bigint           not null
#  score              :integer          not null
#  max_possible_score :integer          not null
#  question_count     :integer          not null
#  answer_count       :integer          not null
#  result             :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe Result, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
