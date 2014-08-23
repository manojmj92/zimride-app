	class Car < ActiveRecord::Base
	attr_accessible :seats,:typeofcar
	belongs_to :user
	

	def self.returnseats current_user
	
		current_user.cars.find(:all,:select => :seats).map(&:seats)
	end
end
