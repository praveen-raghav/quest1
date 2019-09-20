class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user

      if session[:return_point]
        prev_path = session[:return_point]
        session.delete(:return_point)
        redirect_to prev_path
      else
        redirect_to posts_path
      end
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to posts_path
  end

end
