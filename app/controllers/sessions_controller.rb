class SessionsController < ApplicationController
  def new
    @user = current_user #possible error here
    render :new
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
      render :new
    else
      login_user!(@user)
      redirect_to root_url
    end
  end

  def destroy
  end
end
