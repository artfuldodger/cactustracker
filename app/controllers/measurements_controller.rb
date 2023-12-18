class MeasurementsController < ApplicationController
  before_action :set_plant
  before_action :set_measurement, only: %i[ show edit update destroy ]

  # GET /measurements or /measurements.json
  def index
    @measurements = @plant.measurements
  end

  # GET /measurements/1 or /measurements/1.json
  def show
  end

  # GET /measurements/new
  def new
    @measurement = @plant.measurements.new(date: Date.today)
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements or /measurements.json
  def create
    @measurement = @plant.measurements.new(measurement_params)

    respond_to do |format|
      if @measurement.save
        format.html { redirect_to user_plant_url(@plant.user, @plant), notice: "Measurement was successfully created." }
        format.json { render :show, status: :created, location: @measurement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurements/1 or /measurements/1.json
  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to user_plant_url(@plant.user, @plant), notice: "Measurement was successfully updated." }
        format.json { render :show, status: :ok, location: @measurement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1 or /measurements/1.json
  def destroy
    @measurement.destroy

    respond_to do |format|
      format.html { redirect_to plant_url(@plant), notice: "Measurement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_plant
    @plant = current_user.plants.find(params[:plant_id])
  end

  def set_measurement
    @measurement = @plant.measurements.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def measurement_params
    params.require(:measurement).permit(:date, :size, :unit)
  end
end
