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
		@reading = Reading.new(level: params[:reading][:level], user_id: current_user.id)
		if @reading.save
			redirect_to root_url
		else
			render 'new'
		end
	end

	def destroy

	end

	private

	def reading_params
		params.require(:reading).permit(:level)
	end
end
