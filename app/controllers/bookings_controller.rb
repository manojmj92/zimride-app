class BookingsController < ApplicationController
	before_filter :add_cost, :only=>[:create]
	
	def new
		@booking = Booking.new
	end

	def create
		@booking = current_user.bookings.build(params[:booking])
		if @booking.save
			flash[:success] = "Booking created!"
			redirect_to user_bookings_path(current_user.id)
		else
			render :template => 'public/404.html', :status => 404
		end
	end

	def index
		@bookings = current_user.bookings.find(:all, :include => [:ride])
	end

	private

	def add_cost
		params[:booking][:totalcost] = params[:booking][:ridecost].to_i * params[:booking][:noofseats].to_i
	end
end