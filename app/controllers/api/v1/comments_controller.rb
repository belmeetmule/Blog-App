class Api::V1::CommentsController < Api::V1::ApplicationController
  before_action :set_post, only: %i[index show create]
  before_action :set_author, only: %i[index show create]

  def index
    comments = @post.comments
    json_response(comments)
  end

  def show
    @comment = set_post.comments.find(params[:id])
    json_response(@comment)
  end

  def create
    # should use current_user
    @comment = @author.comments.new(post: @post, **comment_params)
    if @comment.save
      json_response(@comment, :created)
    else
      json_response(@comment, :unprocessable_entity)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def json_response(object, status = :ok)
    render json: object, status:
  end

  def set_author
    @author = User.find(params[:user_id])
  end

  def set_post
    @post = set_author.posts.find(params[:post_id])
  end

  def comment_params
    params.permit(:text)
  end
end
