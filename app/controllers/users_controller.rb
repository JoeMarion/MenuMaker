class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      warden.set_user(@user)
      flash[:success] = "Welcome to Menu Maker!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name,
                                   :username, :email,
                                   :password,
                                   :password_confirmation)
    end
end
