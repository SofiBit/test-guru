class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to cookies.delete(:return_to) || root_path
    else
      flash.now[:alert] = 'Are you a guru? Varify your Email and Password please!'
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    cookies[:email] = nil
    redirect_to login_path
  end
end
