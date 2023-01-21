class StaticPagesController < ApplicationController
  def home
    @quick_test = Test.find_by(title: "Personality Test")
  end

  def help
  end
end
