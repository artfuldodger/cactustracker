class Users::PlantsController < ApplicationController
  def show
    @user = User.find_by(slug: params[:user_id])
    @plant = @user.plants.find(params[:id])
    @pagy, @comments = pagy(@plant.comments, items: 8, fragment:'#comments')
  end
end
