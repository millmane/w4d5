class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    User.find_by_id(params[:id]).delete
    render :new
  end

  def edit

  end

  private
  def user_params
    params.require(:user).permit(:password, :username)
  end
end
