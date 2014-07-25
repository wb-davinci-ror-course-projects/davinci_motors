class CarsController < ApplicationController

  before_action :set_car, only: [:show, :edit, :update]

  def index
    @cars = Car.all
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_car
    if @car
      @car = Car.find(params[:id])
    else
      @car = Car.first
    end
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :price)
  end

end