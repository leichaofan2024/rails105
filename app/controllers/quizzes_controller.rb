class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all

  end


  def show
    @quiz = Quiz.find(params[:id])
    @question = Question.new 
  end


end
