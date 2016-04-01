class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find_by(params[:id])
    render :show
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to :show
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    User.find_by(params[:id]).delete
  end

  def edit

  end

  private
  def user_params
    params.require(:users).permit(:session_token, :password, :username)
  end
end
