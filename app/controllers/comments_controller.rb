class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    post = Post.find(params[:post_id])
    comment = Comment.create(author: current_user, post:, **comment_params)

    if comment.save
      flash[:success] = 'Comment was successfully saved !'
    else
      flash.now[:error] = 'Error: Comment could not be saved'
    end
    redirect_to user_post_url(current_user.id, post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
