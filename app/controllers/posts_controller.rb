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

  # delete posst
  def destroy
    post = Post.find(params[:id])
    puts 'i was here'
    if post.destroy
      flash[:success] = 'Post was successfully deleted.'
    else
      flash[:error] = 'Error: Post could not be deleted'
    end
    redirect_to user_posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
