class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html { render 'users/index' }
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(author: @user.id)
    respond_to do |format|
      format.html { render 'users/show' }
      format.json { render json: { user: @user, posts: @posts } }
    end
  end
end
