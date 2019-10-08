class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question), notice: t('.notice')
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
          .merge(user_id: current_user.id)
  end
end
