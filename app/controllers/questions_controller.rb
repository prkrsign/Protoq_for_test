class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @question.question_contents.build
  end

  def create
    @question = Question.new(question_params)
    unless @question.save
      render :new and return
    end
    redirect_to questions_path
  end

  def show
    impressionist(@question, nil, unique: [:session_hash])
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params
      .require(:question)
      .permit(
        :category_id,
        :title,
        question_contents_attributes: [:id, :content, :_destroy])
      .merge(user_id: current_user.id)
  end
end
