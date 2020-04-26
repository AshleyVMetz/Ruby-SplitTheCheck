class RestaurantsController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!, except: [ :index, :search ]
  before_action :set_restaurant, except: [:index, :search, :new, :create]
  
  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    respond_to do |format|
      if @restaurant.save
        vote = params[:restaurant][:vote]
        if vote == "split"
         @restaurant.add_vote(current_user.id, true)
        elsif vote == "nosplit"
          @restaurant.add_vote(current_user.id, false)         
        end 

        format.html { redirect_to restaurants_path, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @restaurant_name_param = params.fetch(:name, "")
    @restaurant_city_param = params.fetch(:city, "")
    @restaurant_state_param = params.fetch(:state, "")
    @restaurants = Restaurant.all
    if (@restaurant_name_param.present?)  
       @restaurants = @restaurants.where('lower(name) like :name', name: @restaurant_name_param.downcase)
    end
    if (@restaurant_city_param.present?)
       @restaurants = @restaurants.where('lower(city) like :city', city: @restaurant_city_param.downcase)
    end
    if (@restaurant_state_param.present?)
       @restaurants = @restaurants.where('lower(state) like :state', state: @restaurant_state_param.downcase)
    end
    render :index    
end

  def split 
     @userID = current_user.id
     @restaurantID = @restaurant.id
     @split = true
     @voteHistory = VoteHistory.new( user_id:@userID, restaurant_id:@restaurantID, split:@split)
     @voteHistory.save
     
     render :show
  end

  def nosplit
     @userID = current_user.id
     @restaurantID = @restaurant.id
     @split = false
     @voteHistory = VoteHistory.new( user_id:@userID, restaurant_id:@restaurantID, split:@split)
     @voteHistory.save
    
     render :show
  end
  
  def add_comment
     
     @restaurant.add_comment(current_user.id, comment_params[:comment])
     respond_to do |format|
     format.html { redirect_to restaurants_path, notice: 'Comment was successfully created.' }
      
     end
  end

  def new_comment

     @comment = Comment.new
     
  end


  def add_favorite

     @restaurant.add_favorite(current_user.id)
     respond_to do |format|
      format.html { 
           flash.now[:notice] = "Favorite was Added"  
           render :show }
      format.json { head :ok }
    end
     
    


  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      permitted = params.require(:restaurant).permit(:name, :city, :state)
     
      permitted
    end

    def comment_params
      params.require(:comment).permit(:comment)
    end
    
end
