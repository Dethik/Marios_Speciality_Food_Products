class ProductsController < ApplicationController
  def index
    if params[:search]
      @products = Product.where('name LIKE ?', "%#{params[:search]}%")
    elsif params[:sort_rating]
      @products = Product.order("rating DESC")
    elsif params[:sort_alpha]
      @products = Product.order("name")
    else
      @products = Product.order("name")
    end
    render :index
  end

  def new
    @product = Product.new
    render :new
  end
end