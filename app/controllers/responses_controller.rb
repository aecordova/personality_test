class ResponsesController < ApplicationController
  def new
    @response = Response.new
    @test = Test.includes(:questions).find(params[:id])
  end

  def create
    #TBD
  end

  def response_params
    params.require(:response).permit(
      user: [:name, :id],
      answers: {}
    ).merge(test_id: params[:id])
  end
end