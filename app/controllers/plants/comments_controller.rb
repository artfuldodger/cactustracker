class Plants::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plant

  def create
    @comment = @plant.comments.new(comment_params)

    if @comment.save
      redirect_to plant_url(@plant), notice: 'Comment added!'
    else
      render 'users/plants/show'
    end
  end

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user: current_user)
  end
end
