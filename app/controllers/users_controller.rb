class UsersController < ApplicationController
  layout 'mmenu'
  before_filter :user_signed_in?

  def index

  end

end