class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all

  end


  def show
    @quiz = Quiz.find(params[:id])
    @question = Question.new
    @exam = Exam.new(quiz_id: @quiz.id, user_id: current_user.id )
  end


end
