class QuestionsController < ApplicationController

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.new(question_params)
    @question.quiz = @quiz
    if @question.save
      redirect_to quiz_path(params[:quiz_id])
    else
      flash[:alert] = "新建失败"
    end
  end


  private

  def question_params
    params.require(:question).permit(:body, :answer)
  end
end
