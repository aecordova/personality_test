class ResultCalculator < ApplicationService
  def initialize(response)
    @response = response
    @answers = response.answers
    @outcome = Outcome.new
  end

  def call
    Result.transaction do
      outcome.data = Result.create!(
        response: response,
        score: score,
        max_possible_score: max_possible_score,
        question_count: question_count,
        answer_count: answer_count,
        result: calculate_result
      )
    rescue ActiveRecord::RecordInvalid => e
      outcome.add_error(:create_result, e.message)
    end

    outcome
  end

  private

  attr_reader :response, :answers, :outcome, :calculation

  def score
    @score ||= answers.sum(:answer_value)
  end

  def answer_count
    answers.count
  end

  def max_possible_score
    calculation.class.max_possible_score
  end

  def question_count
    response.questions.count
  end

  #TODO: This version only works for a sum-of-all-answered type of test, for other types,
  #      we'll need to add a new column to the test table to store the type of test and add
  #      a Calculation class for each type of test.
  def calculate_result
    calculation.result
  end

  def calculation
    @calculation ||= response.test.calculation.new(score)
  end
end