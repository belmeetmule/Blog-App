class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @pagy, @posts = pagy(@user.posts)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:author)
  end

  def new
    @new_post = Post.new
  end

  def create
    post = Post.new(author: current_user, **post_params)

    if post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_url
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
