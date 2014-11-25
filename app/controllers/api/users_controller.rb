class Api::UsersController < Api::BaseController

  def index
    @users = User.all
  end

	def create
    @user = User.new(user_params)
    if @user.save
      render action: 'show'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    render action: 'show'
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
  end

  def spotfixes
    user = User.find(params[:id])
    @spotfixes = user.spotfixes
  end

  def count
    @attendee_count = Attendee.attended.count
  end

  private
  def user_params
    params.permit(:name, :email, :gender, :city_id, :fb_id, :token, :latitude, :longitude)
  end
end