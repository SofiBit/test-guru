class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question
    gist = GistQuestionService.new(question).run
    if ResultGist.new(gist).success?
      current_user.gists.create(question: question, url: gist.html_url)
      flash[:notice] = flash_success(gist.html_url)
    else
      flash[:notice] = flash_failure
    end
    redirect_to @test_passage
  end

  private

  def flash_success(gist_url)
    link = "#{view_context.link_to gist_url, gist_url, target: '_blank'}"
    "You have created the new gist #{link}"
  end

  def flash_failure
    "An error occurred while creating the gist"
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
