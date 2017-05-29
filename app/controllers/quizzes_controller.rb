class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end


  def show
    @quiz = Quiz.includes(:questions).find(params[:id])

    @question = Question.new
   #Text = Exam.create(quiz_id: @quiz.id, user_id: current_user.id )

    #@exam = Text.last
    @exam = Exam.includes(:answers).where(quiz_id: @quiz.id, user_id: current_user.id )
          .order("id desc")
          .first_or_create(quiz_id: @quiz.id)
    @answers = @exam.answers
  end


end
