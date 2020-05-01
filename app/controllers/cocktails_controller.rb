class CocktailsController < ApplicationController
  before_action :find_cocktail, only: %i[show edit update destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def edit; end

  def update
    @cocktail.update(cocktail_params)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(
      :name,
      photos: []
    )
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
