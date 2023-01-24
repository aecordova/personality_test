class ResultsController < ApplicationController
  def show
    @result = result
  end

  private

  def result
    @result = Response.includes(:result, :test).find(params[:id]).result
  end
end
