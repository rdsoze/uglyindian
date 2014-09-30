class SpotfixesController < ApplicationController
  layout 'loggedin'
  # before_filter :user_signed_in?
  # before_filter :fetch_location

  def index
    spotfixes = Spotfix.all
    @fixies = spotfixes.collect { |sf| { latitude: sf.latitude, longitude: sf.longitude,  info: sf.info } } 
  end

  def new
    @city = City.find_or_create(params[:city_name])
    @spotfix = Spotfix.new(city_id: @city.id)   
  end

  def create
    @spotfix = Spotfix.create(spotfix_params)
  end

  def edit
    @spotfix = Spotfix.find(params[:id])
  end

  def update
    @spotfix = Spotfix.find(params[:id])
    @spotfix.update!(spotfix_params)
  end

  def destroy
    @spotfix = Spotfix.find(params[:id])
    @spotfix.deactivate
  end

  def lead
    @spotfix = Spotfix.find(params[:id])
    @spotfix.leader = User.find(params[:user_id])
  end

  def unlead
    @spotfix = Spotfix.find(params[:id])
    if @spotfix.leader_id == params[:user_id]
      @spotfix.leader = nil
    end
  end

  private

  def spotfix_params
    params.permit(:description, :fix_date, :location_1, :location_2, :latitude, :longitude, :active)    
  end

  

end
