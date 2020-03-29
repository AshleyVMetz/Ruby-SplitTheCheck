class RestaurantsController < ApplicationController
  protect_from_forgery
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :split, :nosplit]
  
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
    # if (@restaurant.split).nil?
    # @restaruant.split = 0
    # end     
     @curr_split = @restaurant.split
     @restaurant.split = @curr_split + 1
     @restaurant.save 
     render :show
  end

  def nosplit
    # if (@restaurant.nosplit).nil?
     
    # @restaurant.nosplit = 0     
    # end
     @curr_nosplit = @restaurant.nosplit
      
     @restaurant.nosplit = @curr_nosplit + 1
     
     @restaurant.save
     render :show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      vote = params[:restaurant][:vote]
      permitted = params.require(:restaurant).permit(:name, :city, :state, :split, :nosplit)
      if vote == "split"
         permitted[:split] = 1
         permitted[:nosplit] = 0
      elsif vote == "nosplit"
         permitted[:split] = 0
         permitted[:nosplit] = 1
      end
      permitted
    end
end
