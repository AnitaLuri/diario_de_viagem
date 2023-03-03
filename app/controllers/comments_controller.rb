class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post.id), notice: t('.success')
    else
      redirect_to post_path(@post.id), alert: t('.failure')
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    flash[:notice] = t('.destroy_success')
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :comment_text)
  end
end
