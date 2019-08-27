class CatsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @cat = Cat.all.page(params[:page]).per_page(10)
  end

  def new
    @cat = Cat.new
  end

  def create
    current_user.cat.create(cat_params)
    redirect_to root_path
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :description)
  end
end
