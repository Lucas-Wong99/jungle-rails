class SessionsController < ApplicationController

  def new
    @message = nil
  end

  def create
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      @message = 'Sorry! Incorrect email or password.'
      render '/sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

end
