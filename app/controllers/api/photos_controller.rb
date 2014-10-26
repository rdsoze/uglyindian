class Api::PhotosController < Api::BaseController
  def index
    @photos = Photo.all
  end

	def create
    @photo = Photo.new(photo_params)
    if @photo.save
      render action: 'show'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update!(photo_params)
    render action: 'show'
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.delete
  end

  private
  def photo_params
    params.permit(:user_id, :spotfix_id, :type, :image, :latitude, :longitude)
  end
end