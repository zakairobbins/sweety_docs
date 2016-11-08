class SessionsController < ApplicationController
	before_action :current_user, except: [:destroy]

  def new

	end

	def create
		user = User.find_by(name: params[:session][:name])
    if (user && user.authenticate(params['session']['password']))
      session[:user_id] = user.id
      redirect_to root_path, success: "Logged in successfully"
    else
      flash.now[:alert] = "Invalid login/password combination"
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
