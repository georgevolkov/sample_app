class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end

  def create
    user = User.authentificate(params[:session][:email], params[:session][:password])

    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    end
  else
    sign_in user
    redirect_to user
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end