class UsersController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!


  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
     @user = current_user.id     
     @user.get_comment
     @user.get_favorite
     @user.get_voteHistory     
  end

