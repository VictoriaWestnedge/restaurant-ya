class RestaurantsController < ApplicationController

def index
  @restaurants = Restaurant.all
end

def show
  @restaurant = Restaurant.find(params[:id])
end

def new
  @restaurant = Restaurant.new
end

def create
  @restaurant = Restaurant.new(restaurant_params)
  # gracias a devise tengo a current_user.id, current_user.name
  # we need to associate an id
  @restaurant.user_id = current_user.id
  if @restaurant.save
    redirect_to restaurants_path
  else
    # create blank form
    render :new, status:  :unprocessable_entity
  end
end

private

def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :specialty, :photo)
  end

end
