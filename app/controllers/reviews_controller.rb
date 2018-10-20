class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /reviews
  # GET /reviews.json
  def index
    # @reviews = Review.all
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews

    render 'index'
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    @movie = Movie.find(params[:movie_id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie_id = @movie.id
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_reviews_path, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to movie_review_path(params[:movie_id], @review.id), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to movie_reviews_path, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def show_movie_reviews

  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :content, :rating)
    end
end
