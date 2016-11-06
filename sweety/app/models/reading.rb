class Reading < ActiveRecord::Base
	before_save :set_date
	belongs_to :user
	# before_save :set_date
	validates :level, presence: true, numericality: { only_integer: true }
	validate :user_quota, :on => :create

  def set_date
    self.date = Date.today
  end

	def self.created_today(date)
		dates = where(date: date)
		# create_data_set(readings)
	end

	def self.month_to_date(date)
		result = where(date: (date.beginning_of_month..date))
		create_data_set(readings)
	end

	def self.in_past_month(date)
		where(date: ((date - 30.days)..date))
		create_data_set(readings)
	end

	def create_data_set(dates)
		readings = dates.map {|date| date.level}
		data_set = {}
		data_set[:max] = readings.max
		data_set[:min] = readings.min
		data_set[:average] = get_average(readings)
		data_set
	end

	def get_average(readings)
		readings.inject{ |sum, number| sum + number } / readings.size
	end

	private

	def user_quota
   errors.add(:base, "Exceeds daily limit") if user.readings.today.count >= 4
  end
end
