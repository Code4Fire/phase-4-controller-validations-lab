class PostsController < ApplicationController

  def show
    post = Post.find(params[:id])
    if post
    render json: post
    else
    render json: { error: "422" }, status: :not_found  
    end
  end
  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    render json: post
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

end
