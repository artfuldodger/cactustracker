class Plants::ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plant
  before_action :set_image, only: %i[edit update destroy]

  def new
    @image = @plant.images.new
  end

  def create
    @image = @plant.images.new(image_params)

    if @image.save
      redirect_to user_plant_url(@plant.user, @plant), notice: 'Picture added!'
    else
      render :new
    end
  end

  def destroy
    @image.destroy
    redirect_to user_plant_url(@plant.user, @plant), notice: 'Picture deleted.'
  end

  def edit; end

  def update
    if @image.update(image_params)
      redirect_to user_plant_url(@plant.user, @plant), notice: 'Picture updated!'
    else
      render :edit
    end
  end

  private

  def set_plant
    @plant = current_user.plants.find(params[:plant_id])
  end

  def set_image
    @image = @plant.images.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image, :caption)
  end
end
