class Api::InvitesController < Api::BaseController
  def index
    @invites = Invite.all
  end

	def create
    @invite = Invite.new(invite_params)
    if @invite.save
      render action: 'show'
    end
  end

  def show
    @invite = Invite.find(params[:id])
  end

  def update
    @invite = Invite.find(params[:id])
    @invite.update!(invite_params)
    render action: 'show'
  end

  def destroy
    @invite = Invite.find(params[:id])
    @invite.delete
  end

  private
  def invite_params
    params.permit(:spotfix_id, :user_id, :invitee_user_id)
  end
end