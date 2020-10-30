class SessionsController < ApplicationController

  def new
      flash[:danger] = ''
        if logged_in?
          redirect_to posts_path
        end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      respond_to do |format|
      format.html { redirect_to new_session_path, notice: 'Failed to Log in' }
      end
    end
  end

  def destroy
    session.delete(:user_id)
    flash[ :notice ]= ' logged out '
    redirect_to root_path
  end
end
