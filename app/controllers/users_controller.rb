class UsersController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!


  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
     @user = current_user
     @comments = @user.comments
     @favorites = @user.favorites.group(:restaurant_id)          
     @votes = @user.votes.group(:restaurant_id)       
  end

end
