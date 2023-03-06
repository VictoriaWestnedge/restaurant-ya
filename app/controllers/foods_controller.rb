class FoodsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.new
  end

  def create

  end

end
