class Booking < ActiveRecord::Base
	attr_accessible :ride_id,:noofseats,:totalcost
	belongs_to :user
	belongs_to :ride

	after_save :update_seats

	private

	def update_seats

		ride = Ride.find(self.ride_id)
		ride.update_attributes(:seats_available => (ride.seats_available - self.noofseats))
		 	
	end
end
