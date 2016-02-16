class Api::V1::FavouritesController < ApplicationController
  before_action :authenticate_with_token!
  before_action :check_user_permissions, only: [:create, :destroy]
  respond_to :json

  def index
    respond_with User.find(params[:user_id]).favourites
  end

  def create
    recipe = Recipe.find_by_id(favourite_params[:recipe_id])
    if recipe.nil?
      render json: { errors: "Recipe with this id doesn't exist"}, status: 404
    elsif current_user.favourites.include?(recipe)
      render json: { errors: "User already has this recipe in favourites"}, status: 406
    else
      current_user.favourites << recipe
      render json: current_user.favourites, status: 201, location: [:api, current_user]
    end
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    current_user.favourites.delete(recipe)
    render json: current_user.favourites, status: 201, location: [:api, current_user]
  end


  private

  def favourite_params
    params.require(:favourite).permit(:recipe_id)
  end

  def check_user_permissions
    render json: { errors: "Not authenticated" }, status: 403 unless current_user == User.find(params[:user_id])
  end
end
