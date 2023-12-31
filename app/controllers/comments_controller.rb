class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user || current_user_alt
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      respond_to do |format|
        format.json { render json: { post: @comment } }
        format.html { redirect_to user_post_url(current_user || current_user_alt, @comment.post) }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: @comment.errors.full_messages } }
      end
    end
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    render json: { comments: @comments }, status: :ok
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end

  def current_user_alt
    User.find(params[:user_id])
  end
end
