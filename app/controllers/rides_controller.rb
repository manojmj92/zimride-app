class RidesController < ApplicationController

before_filter :find_ride, :only => [:edit,:update,:destroy]
before_filter :seats, :only => [:new,:edit]
before_filter :search_items, :only => [:search,:search_partial]

def new
	
	@cars = current_user.cars
	@ride = Ride.new

end

def create
	
	@ride = current_user.rides.build(params[:ride])
	if @ride.save
		flash[:success] = "Ride created!"
		redirect_back_or_default user_rides_path(current_user.id)
	end
end

def index
	@rides = current_user.rides.find(:all, :include => [:car],:order =>  "status DESC")
	

end

def edit

	@cars = @ride.user.cars
end

def update

  
    if @ride.update_attributes(params[:ride])
      flash[:success]= "Ride Updated"
      redirect_back_or_default user_rides_path(current_user.id)
    else
      
      render 'edit'
    end
  
end

def destroy
	
		

		if @ride.update_attributes(:status => 0 )
    	 		flash[:success] = "Ride delete successful"
    			redirect_back_or_default user_rides_path(current_user.id)
    	else
    		render :template => 'public/404.html', :status => 404
    	end
    	
    

end



def index_for_booking

	@booking = Booking.new
	@rides = Ride.all(:conditions =>['seats_available > ? AND `date` = ? AND `status` = ?', 0, DateTime.now,1 ])
	render 'rides_booking'

end

def search
	
	render 'rides_booking'
	
end

def search_partial
	
	 # respond_to do |format|
   			 
  #  		format.js
  #     end
	render :partial => 'search_partial'	
	
end

private

def find_ride
	@ride = Ride.find(params[:id])
end

def seats
	@seats = Car.returnseats(current_user)
end

def search_items
	val = Ride.search(params[:to],params[:from],params[:date],params[:booking],current_user)
	p "===="
	p val
	 @rides = val[:rides]
	 @booking = val[:booking]
	 @search_date = params[:date]
	 @from = params[:from]
	 @to = params[:to]	
end





end
