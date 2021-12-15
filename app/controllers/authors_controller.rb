 class AuthorsController < ApplicationController
  
  def show
    author = Author.find(params[:id])
    # if author
    render json: author
    # else
    # render json: { error: "422" }, status: :not_found
    # end
  end

  def create
    author = Author.create!(author_params)
    render json: author, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end
  
end
