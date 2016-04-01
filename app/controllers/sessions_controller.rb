class SessionsController < ApplicationController
  def new #possible error here
    redirect_to user_url(current_user)
  end

  def show
    #might not need this
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Incorrect username and/or password"]
    else
      login_user!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    logout_user!

  end
end
