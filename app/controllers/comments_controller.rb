class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(
      author_id: current_user.id,
      post_id: params[:post_id],
      text: params[:comment][:comment]
    )
    return unless @comment.save

    redirect_to user_post_path(@comment.user.id, @post.id)
  end
end
