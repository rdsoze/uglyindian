class Api::SpotfixesController < Api::BaseController

  def index
    @spotfixes = Spotfix.all
  end

  def show
    @spotfix = Spotfix.find(params[:id])
  end

  def create
    @spotfix = Spotfix.new(spotfix_params)
    if @spotfix.save
      if params['photos']
       params['photos']['image'].each do |a|
          @photo = @spotfix.photos.create!(:image => a, :spotfix_id => @spotfix.id)
       end
      end
      unless params['requirements'].blank?
        @need = @spotfix.needs.create!(description: params['requirements'])
      end
      render action: 'show'
    end
  end

  def update
    @spotfix = Spotfix.find(params[:id])
    @spotfix.update!(spotfix_params)
    render action: 'show'
  end

  def destroy
    @spotfix = Spotfix.find(params[:id])
    @spotfix.delete
  end

  def join
    @attendee = Attendee.create(user_id: params[:user_id], spotfix_id: params[:id])
  end

  def leave
    Attendee.where(user_id: params[:user_id], spotfix_id: params[:id]).delete_all
  end

  def attendees
    @attendees = Spotfix.find(params[:id]).attendees
  end

  private

  def spotfix_params
    params.permit(:name, :description, :fix_date, :location, :city_id, :latitude, :longitude)
  end

end
