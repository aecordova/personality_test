class ResponsesController < ApplicationController
  def new
    @response = Response.new
    @test = Test.includes(:questions).find(params[:id])
  end

  def create
    results = ResponseCreator.execute(test, response_params)
  end

  private

  def response_params
    params.require(:response).permit(
      responder: [:name, :id],
      answers: {}
    )
  end

  def test
    @test ||= Test.find(params[:id])
  end
end