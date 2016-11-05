class Reading < ActiveRecord::Base
	before_save :set_date
	belongs_to :user
	validates :level, presence: true, numericality: { only_integer: true }

  def set_date
    self.date = Date.today
  end

	def self.created_today(date)
		dates = where(date: date)
		readings = dates.map {|date| date.level}
		results = {}
		results[:max] = readings.max
		results[:min] = readings.min

	end

	def self.month_to_date(date)
		result = where(date: (date.beginning_of_month..date))
	end

	def self.in_past_month(date)
		where(date: ((date - 30.days)..date))
	end
end
