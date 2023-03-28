class Api::V1::PostsController < Api::V1::ApplicationController
  before_action :set_author, only: %i[index show]

  def index
    posts = @author.posts
    json_response(posts)
  end

  def show
    @post = set_author.posts.find(params[:id])
    json_response(@post)
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def json_response(object, status = :ok)
    render json: object, status:
  end

  def set_author
    @author = User.find(params[:user_id])
  end
end
