class DosesController < ApplicationController
  before_action :find_dose, only: %i[show edit update destroy]

  def index
    @doses = Dose.all
  end

  def show; end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def edit; end

  def update
    @dose.update(dose_params)
  end

  def destroy
    @dose.destroy
    redirect_to doses_path
  end

  private

  def dose_params
    params.require(:dose).permit(
      :description,
      :ingredient_id
    )
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end
end
