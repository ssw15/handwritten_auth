class SessionsController < ApplicationController
  def new
  end

  def create
    @u = User.find_by(:username => params[:username])

    if @u.password == params[:password]
      session[:user_id] = @u.id
      redirect_to users_url, :notice => "It matched!"
    else
      redirect_to users_url, :notice => "Nice try!"
    end
  end

  def destroy
  end
end
