class User < ActiveRecord::Base
	acts_as_authentic do |c|
		c.login_field = 'email'
  	end # block optional

  	has_many :cars, :dependent => :destroy
  	has_many :bookings, :dependent => :destroy
  	has_many :rides
  	has_many :ride_bookings, :source => :bookings, :through => :rides

  	validates_length_of :description, :maximum => 50
end
	