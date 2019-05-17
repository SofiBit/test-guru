class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  #before_action :find_test, only: %i[index create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
     render inline: '<%= Question.all.pluck(:body) %>'
  end

  def show; end

  def new; end

  def create
    question = Test.find(2).questions.create(question_params)
    render plain: question.inspect
  end

  def destroy
    @question.destroy
    render plain: 'Question deleted'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  # def find_test
  #   @test = Test.find(params[:id])
  # end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
