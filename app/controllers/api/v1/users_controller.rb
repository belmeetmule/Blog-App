class Api::V1::UsersController < Api::V1::ApplicationController
  def index
    authors = User.all.order(:id)
    json_response(authors)
  end

  def show
    @author = User.find(params[:id])
    json_response(@author)
  end

  private

  def json_response(object, status = :ok)
    render json: object, status:
  end
end
