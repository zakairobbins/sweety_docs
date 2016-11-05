class ReadingsController < ApplicationController
	before_action :auth_user
	before_action :current_user, only: [:create]

	def index
		redirect_to '/users/new' unless session[:user_id]
	end

	def new
		@reading = Reading.new
	end

	def create
		p '*****************************************'
		p params
		@reading = Reading.new(level: params[:reading][:level], user_id: @user.id)
		if @reading.save
			p '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
			p @reading
			redirect_to root_url
		else
			render
		end
	end

	def destroy

	end

	private

	def reading_params
		params.require(:reading).permit(:level)
	end
end
