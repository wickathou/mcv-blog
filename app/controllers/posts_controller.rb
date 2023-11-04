class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user)
    respond_to do |format|
      format.html { render 'posts/index' }
      format.json { render json: { user: @user, posts: @posts } }
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html { render 'posts/show' }
      format.json { render json: { post: @post } }
    end
  end
end
