class AttendeesController < ApplicationController
  layout 'fluid'
  before_filter :user_signed_in?

  def index
    @attendees = current_user.attendees
  end

  def new
    @attendee = Attendee.new({ user_id: current_user.id })
  end

  def create
    @attendee = Attendee.create(user_id: current_user.id, spotfix_id: params[:spotfix_id])
    redirect_to :back, notice: "You are now attending this Spotfix"
  end

  def edit
    @attendee = current_user.attendees.find(params[:id])
  end

  def update
    @attendee = current_user.attendees.find(params[:id])
    @attendee.update!(attendee_params)
  end

  def destroy
    @attendee = current_user.attendees.find(params[:id])
    @attendee.deactivate
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

  def attendee_params
    params.permit(:user_id, :spotfix_id)    
  end

  

end