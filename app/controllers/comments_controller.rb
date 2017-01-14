class CommentsController < ApplicationController
  respond_to :js
  before_action :load_comment, only: [:update, :destroy]

  def create
    @comment = Comment.new(comment_params.merge(user_id: current_user.id))

    if @comment.save
      head 200
    else
      head 422
    end
  end

  def update
    if @comment.update(comment_params)
      head 200
    else
      head 422
    end
  end

  def destroy
    @comment.destroy
    head 200
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :drink_id)
  end

  def load_comment
    @comment = Comment.find params[:id]
  end
end
