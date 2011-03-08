class QuestionsController < ApplicationController
  def search
    @question = Question.new
  end
end