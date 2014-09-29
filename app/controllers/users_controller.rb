class UsersController < ApplicationController
  layout 'fluid'
  before_filter :user_signed_in?

  def index

  end

end