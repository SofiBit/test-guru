class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def index
    render inline: "<% Test.all.each do |test| %> <%= test.title %> <% end %>"
  end

  def show
    render inline: "<%= @test.title %>"
  end

  def new; end

  def create
    test = Test.create(test_params)
    render plain: test.inspect
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end
