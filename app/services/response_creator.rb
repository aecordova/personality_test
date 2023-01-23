class ResponseCreator < ApplicationService
  def initialize(test, params)
    @test = test
    @responder = params[:responder]
    @answers = build_answer_data(params[:answers])
    @outcome = Outcome.new
  end

  def call
    ActiveRecord::Base.transaction do
      find_or_create_responder
      create_response
      create_answers
      calculate_test_results
    end

    outcome.data = @response
    outcome
  end

  private

  attr_reader :responder, :answers, :test
  attr_accessor :outcome

  def find_or_create_responder
    @responder = if responder[:id].present?
                    User.find!(responder[:id])
                 else
                    User.create(name: responder[:name], role: :guest)
                 end
  rescue => e
    handle_error(:find_or_create_responder, e.message)
  end

  def create_response
    @response = Response.create(responder: responder, test: test)
  rescue => e
    handle_error(:create_response, e.message)
  end

  def create_answers
    answers.each do |ans|
      Answer.create(
        question_id: ans[:question_id], 
        answer_value: ans[:answer_value], 
        response: @response, 
        responder: @responder
      )
    end
  rescue => e
    handle_error(:create_answers, e.message)
  end

  def calculate_test_results
    result = ResultCalculator.new(@response).call
    outcome.add_errors(result.errors) if result.errors.any?
  end

  def handle_error(step, message)
    outcome.add_error(step, message)
    raise ActiveRecord::Rollback
  end

  def build_answer_data(answer_params)
    answer_data = []
    answer_params.each do |ans|
      question_id = ans.first.split(":").second.to_i
      answer_value = ans.second.to_i

      answer_data << { question_id: question_id, answer_value: answer_value }
    end
    answer_data
  end
end