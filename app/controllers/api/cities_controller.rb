class Api::CitiesController < Api::BaseController
  def index
    @cities = City.all
  end

	def create
    @city = City.new(city_params)
    if @city.save
      render action: 'show'
    end
  end

  def show
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    @city.update!(city_params)
    render action: 'show'
  end

  def destroy
    @city = City.find(params[:id])
    @city.delete
  end

  def spotfixes
    @city = City.find(params[:id])
    @spotfixes = @city.spotfixes
  end

  def count
    @city = City.find(params[:id])
    @spotfix_count = @city.spotfixes.count
    @attendee_count = @city.attendees.attended.count
  end
  
  private
  def city_params
    params.permit(:name, :latitude, :longitude)
  end
end