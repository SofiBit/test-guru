class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]

  def index
     render inline: '<%= Question.all.pluck(:body) %>'
  end

  def show; end

  def destroy
    @question.destroy
    render plain: 'Question deleted'
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end
end
