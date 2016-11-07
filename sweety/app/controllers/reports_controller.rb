class ReportsController < ApplicationController
	before_action :auth_user

	def new

	end

	def create
		readings = get_readings_from_range(params[:time_range])
		@report = create_report(readings) if readings.length > 0
	end

  private

  def report_params
  	params.permit(date, time_range)
  end

  def get_readings_from_range(range)
  	if range == '1'
  		current_user.readings.created_today(params[:date]['end_date'])
  	elsif range == '2'
  		current_user.readings.month_to_date(params[:date]['end_date'])
  	else
  		current_user.readings.in_past_month(params[:date]['end_date'])
  	end
  end

  def create_report(readings)
		levels = readings.map {|reading| reading.level}
		data_set = {}
		data_set[:max] = levels.max
		data_set[:min] = levels.min
		data_set[:average] = get_average(levels)
		data_set
	end

	def get_average(readings)
		readings.inject{ |sum, number| sum + number } / readings.size
	end
end
