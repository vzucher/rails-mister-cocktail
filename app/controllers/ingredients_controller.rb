class IngredientsController < ApplicationController
  before_action :find_ingredient, only: %i[show edit update destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show; end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    redirect_to ingredient_path(@ingredient)
  end

  def edit; end

  def update
    @ingredient.update(ingredient_params)
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(
      :name
    )
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
