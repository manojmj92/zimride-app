class CarsController < ApplicationController

	before_filter :find_car , :only => [:edit,:update]

	def create
		@car = current_user.cars.build(params[:car])
		if @car.save
			flash[:success] = "Car added!"
			redirect_back_or_default root_path
		else
			render :template => 'public/404.html', :status => 404
		end
	end


	def new
		@car = Car.new
	end



	def edit
		
	end



	def update
		
    	if @car.update_attributes(params[:car])
     	 	flash[:success]= "Car Details Updated"
      		redirect_back_or_default root_path
      	else
      		render :template => 'public/404.html', :status => 404
     	 end
	end



	def destroy
		if Car.destroy(params[:id])
    		flash[:success] = "Car delete successful!"
    		redirect_back_or_default root_path
    	else
    		render :template => 'public/404.html', :status => 404
    	end
    	
    end

    private

    def find_car

    		@car = Car.find(params[:id])
    end


    
end
