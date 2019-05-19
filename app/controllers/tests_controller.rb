class TestsController < ApplicationController
  before_action :find_test, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    render inline: "<% Test.all.each do |test| %> <%= test.title %> <% end %>"
  end

  def show; end

  def new; end

  def create
    test = Test.create(test_params)
    render plain: test.inspect
  end

  def destroy
    @test.destroy
    render plain: 'Test deleted'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
