class Users::PlantsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @plant = @user.plants.find(params[:id])
  end
end
