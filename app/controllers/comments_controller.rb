class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cat = Cat.find(params[:cat_id])
    @cat.comments.create(comment_params.merge(user: current_user))
    redirect_to cat_path(@cat)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
