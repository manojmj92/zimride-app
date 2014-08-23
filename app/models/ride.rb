class Ride < ActiveRecord::Base
	attr_accessible :from,:to,:date,:car_id,:seats_available,:cost,:status
	belongs_to :user
	belongs_to :car
	has_many :users
	has_many :bookings

	
private
def self.search(to,from,date,booking,current_user)
	val = Hash.new
	val[:booking] = current_user.bookings.build(booking)
	if  from.present? 
		val[:rides] = Ride.all(:conditions => ['`from`= ?  AND `to` = ? AND seats_available > ? AND `date` =? AND `user_id` != ? AND `status` = ?',from,to,0,date,current_user.id,1 ])
		
	else
		val[:rides] = Ride.all(:conditions => ['`to` = ? AND seats_available > ? AND `date` =? AND `user_id` != ? AND `status` = ? ',to,0,date,current_user.id,1 ])
	end
	
	return val
end


end
