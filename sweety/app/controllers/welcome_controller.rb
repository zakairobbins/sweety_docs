class WelcomeController < ApplicationController
	before_action :auth_user, except: [:login]
	before_action :current_user

	def index

	end

	def login

	end
end
