class Reading < ActiveRecord::Base
	belongs_to :user
	before_save :set_date
	validates :level, presence: true, numericality: { only_integer: true }
	validate :user_quota, :on => :create

  def set_date
    self.date = Date.today
  end

	def self.created_today(date)
		where(date: date)
	end

	def self.month_to_date(date)
		date = Date.strptime(date, '%Y-%m-%d')
		where(date: (date.beginning_of_month..date))
	end

	def self.in_past_month(date)
		date = Date.strptime(date, '%Y-%m-%d')
		where(date: ((date - 30.days)..date))
	end

	private

	def user_quota
   errors.add(:user_quota, "Exceeds daily limit") if user.readings.today.count >= 4
  end
end
