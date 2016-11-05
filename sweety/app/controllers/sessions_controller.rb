class SessionsController < ApplicationController
	def new

	end

	def create
		user = User.find_by(name: params[:session][:name])
    if (user && user.authenticate(params['session']['password']))
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Logged in successfully"
    else
      flash.now[:alert] = "Invalid login/password combination"
      render :action => 'new'
    end
  end
end
