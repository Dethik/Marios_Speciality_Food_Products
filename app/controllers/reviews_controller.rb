class ReviewsController < ApplicationController
  def index
    @reviews = Review.order("rating")
    @review = Review.new
    render :index
  end

  def create
    @reviews = Review.all
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "review added!"
      redirect_to reviews_path
    else
      render :index
    end
  end

  def edit
    @review = Review.find(params[:id])
    render :edit
  end

  def show
    @review = Review.find(params[:id])
    render :show
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "review updated!"
      redirect_to reviews_path
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "review deleted!"
    redirect_to reviews_path
  end

  private
    def review_params
      params.require(:review).permit(:title)
    end
end