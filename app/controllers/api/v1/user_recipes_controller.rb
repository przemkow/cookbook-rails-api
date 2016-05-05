class Api::V1::UserRecipesController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    respond_with User.find(params[:user_id]).recipes
  end

  private
end
