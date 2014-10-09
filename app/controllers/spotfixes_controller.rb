class SpotfixesController < ApplicationController
  layout 'loggedin'
  before_filter :user_signed_in?, :except => [:index, :show, :og_share, :og_invite]
  # before_filter :fetch_location

  def index
    spotfixes = Spotfix.all
    @fixies = spotfixes.collect { |sf| { latitude: sf.latitude, longitude: sf.longitude,  info: sf.info } } 
  end

  def new
    @spotfix = Spotfix.new()  
    @photo = @spotfix.photos.build 
  end

  def show
    @spotfix = Spotfix.find(params[:id])
    @attending = (current_user)? Attendee.where(user_id: current_user.id, spotfix_id: params[:id]).first : nil
  end

  def create
    @spotfix = Spotfix.new(spotfix_params)
    respond_to do |format|
      if @spotfix.save
        if params['photos']
         params['photos']['image'].each do |a|
            @photo = @spotfix.photos.create!(:image => a, :spotfix_id => @spotfix.id)
         end
        end
        unless params['requirements'].blank?
          @need = @spotfix.needs.create!(description: params['requirements'])
        end
       format.html { redirect_to @spotfix, notice: 'Spotfix was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
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

  def join
    @attendee = Attendee.create(user_id: current_user.id, spotfix_id: params[:id])
    redirect_to spotfix_path(params[:id]), notice: "You are now attending this Spotfix"
  end

  def leave
    Attendee.where(user_id: current_user.id, spotfix_id: params[:id]).delete_all
    redirect_to spotfix_path(params[:id]), notice: "You have left this Spotfix"
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

  def get_lat_lng
    @city = City.find_or_create(params[:city_name])
    render json: @city
  end

  def og_share
    @spotfix = Spotfix.find(params[:id])
    @city = @spotfix.city
    render layout: 'og'
  end

  def og_invite
    @spotfix = Spotfix.find(params[:id])
    @city = @spotfix.city
    render layout: 'og'
  end

  private

  def spotfix_params
    # params.permit(:spotfix => [ :description, :fix_date, :location, :city_id, :latitude, :longitude], :photos => [:image => []])
    params.require(:spotfix).permit(:description, :fix_date, :location, :city_id, :latitude, :longitude)
  end

  def photo_params
    params.require(:photos).permit(:image => [])
  end



  

end
