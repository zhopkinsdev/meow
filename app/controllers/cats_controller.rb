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
    @cat = current_user.cat.create(cat_params)
    if @cat.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @cat = Cat.find(params[:id])
    @comment = Comment.new
    @photo =Photo.new
  end

  def edit
    @cat = Cat.find(params[:id])

    if @cat.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    if @cat.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @cat.destroy
    redirect_to root_path
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :description)
  end
end
