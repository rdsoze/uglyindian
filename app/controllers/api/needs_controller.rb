class Api::NeedsController < Api::BaseController
	def index
    @needs = Need.all
  end

  def create
    @need = Need.new(need_params)
    if @need.save
      render action: 'show'
    end
  end

  def show
    @need = Need.find(params[:id])
  end

  def update
    @need = Need.find(params[:id])
    @need.update!(need_params)
    render action: 'show'
  end

  def destroy
    @need = Need.find(params[:id])
    @need.delete
  end

  private
  def need_params
    params.permit(:spotfix_id, :name, :count, :description)
  end
end