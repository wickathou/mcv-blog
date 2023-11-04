class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = Like.new(user_id: current_user.id, post_id: @post.id)
    
    if @like.save
      redirect_to user_post_url(current_user, @post)
    else
      redirect_to user_posts_url(current_user)
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
