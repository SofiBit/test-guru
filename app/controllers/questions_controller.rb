class QuestionsController < ApplicationController
  def index
     render inline: '<%= Question.all.pluck(:body) %>'
  end
end
