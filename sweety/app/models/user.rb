class User < ActiveRecord::Base
  has_secure_password
  validates :name, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :readings do
	  def today
	      where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now))
	  end
	end
end
