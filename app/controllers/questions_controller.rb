class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]

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
end
