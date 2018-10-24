class LikesController < ApplicationController
  before_action :authenticate_user!

  def do_id_numbers
    if Like.where(user_id: current_user.id).where(movie_id: params[:id]).exists?
      redirect_to reviews_movie_path
    else
      @like = Like.new(like_params)
      @like.user_id = current_user.id
      @like.movie_id = params[:id]
      @like.save

    redirect_to reviews_movie_path
    end
  end

  def delete_like
    @liked = Like.all.where(user_id: current_user.id).where(movie_id: params[:id]).destroy_all

    redirect_to reviews_movie_path
  end


  private

  def like_params
    params.permit(:movie_id, :user_id)
  end
end
