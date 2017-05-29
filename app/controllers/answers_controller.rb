class AnswersController < ApplicationController
  def set_answer_status
     @answer = Answer.new(question_id: params[:question_id], exam_id: params[:exam_id], is_correct: params[:is_correct])

     @answer.save
     redirect_to :back
  end


end
