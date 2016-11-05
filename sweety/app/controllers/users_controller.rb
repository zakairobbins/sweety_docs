class UsersController < ApplicationController
  def new
  	current_user
  end

  def create
  	@user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome/index'
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
