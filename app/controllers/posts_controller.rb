class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author).where(author: @user)
    respond_to do |format|
      format.html { render 'posts/index' }
      format.json { render json: { user: @user, posts: @posts } }
    end
  end

  def show
    @post = Post.includes(comments: [:user]).find(params[:id])
    respond_to do |format|
      format.html { render 'posts/show' }
      format.json { render json: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      respond_to do |format|
        format.html { redirect_to user_post_url(current_user, @post) }
        format.json { render json: { post: @post } }
      end
    else
      respond_to do |format|
        format.html { redirect_to user_posts_url(current_user) }
        format.json { render json: { errors: @post.errors.full_messages } }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
