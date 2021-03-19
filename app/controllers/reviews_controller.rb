class ReviewsController < ApplicationController
  def index
    @products = Product.all
    @reviews = Review.all
    render :index
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to product_path(@review.product)
    else
      flash[:notice] = "Your product was not added."
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to product_path(@review.product)
    else
      flash[:notice] = "Your product was not added."
      render :edit
    end
  end

  private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end
end