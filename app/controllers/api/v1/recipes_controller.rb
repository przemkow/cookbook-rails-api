class Api::V1::RecipesController < ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_recipe, only: [:show, :update, :destroy]
  respond_to :json

  # GET
  def index
    recipes = Recipe.all
    respond_with recipes
  end

  # GET
  def show
    respond_with @recipe
  end

  # POST
  def create
    recipe = Recipe.new(recipe_params)
    recipe.user = current_user
    if recipe.save
      render json: recipe, status: :created, location: recipe
    else
      render json: recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT
  def update
    if @recipe.update(recipe_params)
      render json: @recipe, status: :ok, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE
  def destroy
    @recipe.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :preparation_time_in_min)
    end
end
