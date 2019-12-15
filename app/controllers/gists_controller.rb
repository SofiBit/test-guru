class GistsController < ApplicationController
  before_action :find_question

  def create
    gist_url = GistQuestionService.new(@question).run.html_url
    current_user.gists.create(question: @question, url: gist_url)
    flash_message(gist_url)
    redirect_back fallback_location: root_path
  end

  private

  def flash_message(gist_url)
    link = "<a href=\"#{gist_url}\" target=\"_blank\">#{gist_url}</a>"
    flash[:notice] = "You have created the new gist #{link}"
  end

  def find_question
    @question = Question.find(params[:question])
  end
end
