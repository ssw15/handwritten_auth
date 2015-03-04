class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:username => params[:username])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_url, :notice => "Signed in successfully."
    else
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to users_url, :notice => "Signed out successfully."
  end
end
