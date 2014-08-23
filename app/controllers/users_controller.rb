class UsersController < ApplicationController
	before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :find_user, :only => [:edit,:update,:show]
  skip_before_filter :verify_logged_in, :only => [:new,:create]

  def new
    @user = User.new
  end


  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "Your account has been created.Please Login"
      redirect_to signup_url
    else
      flash[:notice] = "There was a problem creating your account."
      render :action => :new
    end

  end

  def edit
    
  end

  def update
   
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      flash[:notice] = "Please enter correct details"
      render :action => :edit
    end
  end

  

  def show
   
   
    @cars = current_user.cars
    @totalcost = total_calculate
      

  end 

  private

  def total_calculate
    cost = Hash.new
    cost[:account]=0
    cost[:upcoming]=0
  
    if current_user.ride_bookings.blank? 
      return cost
    end

    @bookings = current_user.ride_bookings.find(:all,:include=>[:ride])
    @bookings.each do |booking|
      if booking.ride.date < DateTime.now - 1.days
        cost[:account]+= booking.totalcost
      else
       cost[:upcoming] += booking.totalcost
      end
    end
    
        
    return cost

  end

  def find_user
    @user = current_user
  end







end
