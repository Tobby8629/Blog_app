class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new(post_id: @post.id, author_id: current_user.id)
    return unless @like.save

    redirect_to user_post_path(@user.id, @post.id)
  end
end
