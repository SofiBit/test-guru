class Admin::GistsController < ApplicationController
  def index
    @gists = Gist.includes(:user, :question).all
  end
end
