class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      flash[:notice] = t('.success')
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = t('.failure')
      render post_path(@post.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :comment_text)
  end
end