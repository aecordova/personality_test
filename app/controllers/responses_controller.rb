class ResponsesController < ApplicationController
  def new
    @response = Response.new
    @test = Test.includes(:questions).find(params[:id])
  end

  def create
    outcome = ResponseCreator.execute(test, response_params)
    
    if outcome.success?
      redirect_to results_path(outcome.data)
    else
      render :new
    end
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